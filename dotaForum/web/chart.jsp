<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="client.NewJerseyClient"%>
<%@ page import="java.awt.*,org.jCharts.*,org.jCharts.chartData.*,org.jCharts.properties.*,org.jCharts.types.ChartType,org.jCharts.axisChart.*,org.jCharts.test.TestDataGenerator,org.jCharts.encoders.JPEGEncoder13,org.jCharts.properties.util.ChartFont,
org.jCharts.encoders.ServletEncoderHelper"%><%
    /**
     * ************************************************************************************
     * Copyright 2002 (C) Nathaniel G. Auvil. All Rights Reserved.
     *
     * Redistribution and use of this software and associated documentation
     * ("Software"), with or without modification, are permitted provided that
     * the following conditions are met:
     *
     * 1. Redistributions of source code must retain copyright statements and
     * notices. Redistributions must also contain a copy of this document.
     *
     * 2. Redistributions in binary form must reproduce the above copyright
     * notice, this list of conditions and the following disclaimer in the
     * documentation and/or other materials provided with the distribution.
     *
     * 3. The name "jCharts" or "Nathaniel G. Auvil" must not be used to endorse
     * or promote products derived from this Software without prior written
     * permission of Nathaniel G. Auvil. For written permission, please contact
     * nathaniel_auvil@users.sourceforge.net
     *
     * 4. Products derived from this Software may not be called "jCharts" nor
     * may "jCharts" appear in their names without prior written permission of
     * Nathaniel G. Auvil. jCharts is a registered trademark of Nathaniel G.
     * Auvil.
     *
     * 5. Due credit should be given to the jCharts Project
     * (http://jcharts.sourceforge.net/).
     *
     * THIS SOFTWARE IS PROVIDED BY Nathaniel G. Auvil AND CONTRIBUTORS ``AS
     * IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
     * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
     * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL jCharts OR ITS
     * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
     * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
     * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
     * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
     * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
     * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
     * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     * ********************************************************************************
     */

    try {
//From AxisChartServlet.java:init()
        LegendProperties legendProperties = new LegendProperties();
        ChartProperties chartProperties = new ChartProperties();
        AxisProperties axisProperties = new AxisProperties(false);

        ChartFont axisScaleFont = new ChartFont(new Font("Georgia Negreta cursiva", Font.PLAIN, 13), Color.black);
        axisProperties.getXAxisProperties().setScaleChartFont(axisScaleFont);
        axisProperties.getYAxisProperties().setScaleChartFont(axisScaleFont);

        ChartFont axisTitleFont = new ChartFont(new Font("Arial Narrow", Font.PLAIN, 14), Color.black);
        axisProperties.getXAxisProperties().setTitleChartFont(axisTitleFont);
        axisProperties.getYAxisProperties().setTitleChartFont(axisTitleFont);

        Stroke[] strokes = {LineChartProperties.DEFAULT_LINE_STROKE, LineChartProperties.DEFAULT_LINE_STROKE, LineChartProperties.DEFAULT_LINE_STROKE};
        Shape[] shapes = {PointChartProperties.SHAPE_TRIANGLE, PointChartProperties.SHAPE_DIAMOND, PointChartProperties.SHAPE_CIRCLE};
        LineChartProperties lineChartProperties = new LineChartProperties(strokes, shapes);

        String[] xAxisLabels = {"2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"};
        String xAxisTitle = "Years";
        String yAxisTitle = "Quantity";
        String title = "Profile Stats";
        DataSeries dataSeries = new DataSeries(xAxisLabels, xAxisTitle, yAxisTitle, title);

        String id = request.getParameter("id_user");
        NewJerseyClient jc = new NewJerseyClient();
        JSONArray post = jc.getPostByUser(id);
        JSONArray message = jc.getInbox(id);
        JSONArray comment = jc.getCommentByUser(id);
        int[] pos = new int[8];
        int[] com = new int[8];
        int[] mes = new int[8];

        for (int i = 0; i < post.size(); i++) {
            JSONObject jb = (JSONObject) post.get(i);
            String[] date = jb.get("date_time").toString().split("-");
            switch (Integer.parseInt(date[0])) {
                case 2010:
                    pos[0]++;
                    break;
                case 2011:
                    pos[1]++;
                    break;
                case 2012:
                    pos[2]++;
                    break;
                case 2013:
                    pos[3]++;
                    break;
                case 2014:
                    pos[4]++;
                    break;
                case 2015:
                    pos[5]++;
                    break;
                case 2016:
                    pos[6]++;
                    break;
                case 2017:
                    pos[7]++;
                    break;
                default:
                    break;
            }
        }
        for (int i = 0; i < comment.size(); i++) {
            JSONObject jb = (JSONObject) comment.get(i);
            String[] date = jb.get("date_time").toString().split("-");
            switch (Integer.parseInt(date[0])) {
                case 2010:
                    com[0]++;
                    break;
                case 2011:
                    com[1]++;
                    break;
                case 2012:
                    com[2]++;
                    break;
                case 2013:
                    com[3]++;
                    break;
                case 2014:
                    com[4]++;
                    break;
                case 2015:
                    com[5]++;
                    break;
                case 2016:
                    com[6]++;
                    break;
                case 2017:
                    com[7]++;
                    break;
                default:
                    break;
            }
        }
        for (int i = 0; i < message.size(); i++) {
            JSONObject jb = (JSONObject) message.get(i);
            String[] date = jb.get("date_time").toString().split("-");
            switch (Integer.parseInt(date[0])) {
                case 2010:
                    mes[0]++;
                    break;
                case 2011:
                    mes[1]++;
                    break;
                case 2012:
                    mes[2]++;
                    break;
                case 2013:
                    mes[3]++;
                    break;
                case 2014:
                    mes[4]++;
                    break;
                case 2015:
                    mes[5]++;
                    break;
                case 2016:
                    mes[6]++;
                    break;
                case 2017:
                    mes[7]++;
                    break;
                default:
                    break;
            }
        }
//From AxisChartServlet.java:createAxisChartDataSet
        double[][] data = {{pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7]},
        {com[0], com[1], com[2], com[3], com[4], com[5], com[6], com[7]},
        {mes[0], mes[1], mes[2], mes[3], mes[4], mes[5], mes[6], mes[7]}};
        String[] legendLabels = {"Posts", "Comments", "Messages"};
        Paint[] paints = TestDataGenerator.getRandomPaints(3);
        AxisChartDataSet acds = new AxisChartDataSet(data, legendLabels, paints, ChartType.LINE, lineChartProperties);
        dataSeries.addIAxisPlotDataSet(acds);
        AxisChart axisChart = new AxisChart(dataSeries, chartProperties, axisProperties, legendProperties, 550, 360);

        ServletEncoderHelper.encodeJPEG13(axisChart, 1.0f, response);

    } catch (Exception e) {
        System.out.println(e);
    }
%>
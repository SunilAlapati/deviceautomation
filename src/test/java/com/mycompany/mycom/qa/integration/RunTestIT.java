package test.java.com.mycompany.mycom.korra.integration;

import org.apache.maven.reporting.MavenReportException;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.github.mkolisnyk.cucumber.reporting.CucumberDetailedResults;
import com.github.mkolisnyk.cucumber.reporting.CucumberResultsOverview;
import com.github.mkolisnyk.cucumber.reporting.CucumberUsageReporting;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)

@CucumberOptions(plugin = {"progress", "junit:target/cucumber/cucumber.xml", "json:target/cucumber/cucumber.json","usage:target/cucumber/cucumber-usage.json"},
        tags = {"@testme1"}, features = "src/test/resources/features",
        glue = {"com.test.framework.step", "com.steps","com.steps"})
/*
 * 
 */
public class RunTestIT {
   
    public static void main(String[] args) {
        // userd for generating overview report
        CucumberResultsOverview overviewReport = new CucumberResultsOverview();
        // used for generating usage report
        CucumberUsageReporting usageReport = new CucumberUsageReporting();
        //used for generating detailed report
        CucumberDetailedResults detailedReport = new CucumberDetailedResults();
        
        
        detailedReport.setOutputDirectory("target/");
        detailedReport.setOutputName("cucumber-detailed-report");
        detailedReport.setSourceFile("./target/cucumber/cucumber.json");
       
        
        
        overviewReport.setOutputDirectory("target");
        overviewReport.setOutputName("cucumber-overview-report");
        overviewReport.setSourceFile("./target/cucumber/cucumber.json");
        usageReport.setOutputDirectory("target");
        
        
        
        usageReport.setOutputDirectory("target/");
        try {
            usageReport.setJsonUsageFile("./target/cucumber/cucumber-usage.json");
            detailedReport.executeDetailedResultsReport(false);
            usageReport.executeReport();
            overviewReport.executeFeaturesOverviewReport();
            
      } catch (Exception e) {
          e.printStackTrace();
      }
    }
     @BeforeClass
     /**
      * @author achatterjee
      */
      public static void setUp()
      {
          System.out.println("*************************"+System.getProperty("testEnv"));
      }
        @AfterClass
      public static void tearDown()
      {
            System.out.println("CONNECTION CLOSED :)");
            try{
            Thread.sleep(10000l);;
            }catch(Exception e){}
          DBUtil.closeConnection();
          CucumberResultsOverview results = new CucumberResultsOverview();
          results.setOutputDirectory("target");
          results.setOutputName("PS4-cucumberTest-results");
          results.setSourceFile("./target/cucumber/cucumber.json");
          CucumberUsageReporting report = new CucumberUsageReporting();
          report.setOutputDirectory("target");
          try {
            results.executeFeaturesOverviewReport();
            report.setJsonUsageFile("./target/cucumber/cucumber.json");
            report.executeReport();
        } catch (Exception e) {
            e.printStackTrace();
        }
      }
    
    
}



//@ps4createAndLogin 
 //@ps4UpdateAddress 
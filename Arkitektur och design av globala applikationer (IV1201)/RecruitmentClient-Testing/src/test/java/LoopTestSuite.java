
import com.google.common.base.Stopwatch;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.testng.ISuiteResult;
import org.testng.ITestContext;
import org.testng.ITestResult;
import org.testng.TestListenerAdapter;
import org.testng.TestNG;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Used to run test suite number amount of times
 *
 * @author Evan
 */
public class LoopTestSuite {

    /**
     * Method used to run test suite number amount of times
     *
     * @param args
     */
    public static void main(String args[]) {
        int countPassedTests_chrome = 0;
        int countPassedTests_firefox = 0;
        int countSkippedTests_chrome = 0;
        int countSkippedTests_firefox = 0;
        int countFailedTests_chrome = 0;
        int countFailedTests_firefox = 0;
        Stopwatch stopwatch = Stopwatch.createStarted();
        List<String> suites = new ArrayList<>();
        suites.add("src/test/java/suites.xml"); //path of .xml file to be run-provide complete path

        while (24 * 60 > stopwatch.elapsed(TimeUnit.MINUTES)) {
            TestNG tng = new TestNG();
            tng.setTestSuites(suites);
            TestListenerAdapter it = new TestListenerAdapter();
            tng.addListener(it);
            tng.run();
            Map<String, ISuiteResult> res = it.getTestContexts().get(0).getSuite().getResults();
            for (String tests : res.keySet()) {
                ITestContext tc = res.get(tests).getTestContext();
                if (tests.equals("testChrome")) {
                    countPassedTests_chrome += tc.getPassedTests().size();
                    countSkippedTests_chrome += tc.getSkippedTests().size();
                    countFailedTests_chrome += tc.getFailedTests().size();
                }
                if (tests.equals("testFirefox")) {
                    countPassedTests_firefox += tc.getPassedTests().size();
                    countSkippedTests_firefox += tc.getSkippedTests().size();
                    countFailedTests_firefox += tc.getFailedTests().size();
                }
                if (tc.getFailedTests().size() > 0) {
                    for (ITestResult test : tc.getFailedTests().getAllResults()) {
                        test.getThrowable().printStackTrace();
                    }
                }
            }
            printoutTestResults(countPassedTests_chrome, countSkippedTests_chrome, countFailedTests_chrome, countPassedTests_firefox, countSkippedTests_firefox, countFailedTests_firefox);
        }
        stopwatch.stop();
        int[] formatTime = splitToComponentTimes(stopwatch.elapsed(TimeUnit.SECONDS));
        System.out.println("The tests took " + formatTime[0] + " hours, " + formatTime[1] + " minutes and " + formatTime[2] + " seconds.");
        System.out.println("===============================================");
    }

    private static void printoutTestResults(int countPassedTests_chrome, int countSkippedTests_chrome, int countFailedTests_chrome, int countPassedTests_firefox, int countSkippedTests_firefox, int countFailedTests_firefox) {
        int chrome_total_tests = countPassedTests_chrome + countSkippedTests_chrome + countFailedTests_chrome;
        System.out.println("===============================================");
        System.out.println("Chrome Tests:");
        System.out.println("Total tests run: " + chrome_total_tests);
        System.out.println("Total tests Passed: " + countPassedTests_chrome);
        System.out.println("Total tests Failed: " + countFailedTests_chrome);
        System.out.println("Total tests Skipped: " + countSkippedTests_chrome);
        System.out.println("===============================================");

        int firefox_total_tests = countPassedTests_firefox + countSkippedTests_firefox + countFailedTests_firefox;
        System.out.println("===============================================");
        System.out.println("Firefox Tests:");
        System.out.println("Total tests run: " + firefox_total_tests);
        System.out.println("Total tests Passed: " + countPassedTests_firefox);
        System.out.println("Total tests Failed: " + countFailedTests_firefox);
        System.out.println("Total tests Skipped: " + countSkippedTests_firefox);
        System.out.println("===============================================");

        System.out.println("===============================================");
        System.out.println("All Tests:");
        System.out.println("Total tests run: " + (int) (firefox_total_tests + chrome_total_tests));
        System.out.println("Total tests Passed: " + (int) (countPassedTests_firefox + countPassedTests_firefox));
        System.out.println("Total tests Failed: " + (int) (countFailedTests_firefox + countFailedTests_chrome));
        System.out.println("Total tests Skipped: " + (int) (countSkippedTests_firefox + countSkippedTests_chrome));
        System.out.println("===============================================");
    }

    public static int[] splitToComponentTimes(long longVal) {
        int hours = (int) longVal / 3600;
        int remainder = (int) longVal - hours * 3600;
        int mins = remainder / 60;
        remainder = remainder - mins * 60;
        int secs = remainder;

        int[] ints = {hours, mins, secs};
        return ints;
    }

}

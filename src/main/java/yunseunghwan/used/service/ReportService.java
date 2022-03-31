package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Report;

public interface ReportService {
	List<Report> getReports(String userId);
	List<Report> getAdminReports();
	ModelAndView getAdminReport(ModelAndView mv, Report report, HttpSession session);
	ModelAndView getReport(ModelAndView mv, Report report);
	void addReport(Report report);
}

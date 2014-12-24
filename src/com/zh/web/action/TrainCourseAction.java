package com.zh.web.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.web.model.TrainCourseModel;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.model.bean.TrainingOfPersonnel;
import com.zh.web.service.TrainCourseService;
import com.zh.web.service.TrainingOfPersonnelService;

/**
 * 培训管理
 * 
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class TrainCourseAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static Logger LOGGER = LoggerFactory
			.getLogger(TrainCourseAction.class);

	private TrainCourseModel trainCourseModel = new TrainCourseModel();

	@Autowired
	private TrainCourseService trainCourseService;
	
	@Autowired
	private TrainingOfPersonnelService trainingOfPersonnelService;

	public String execute() {
		TrainCourse trainCourse = trainCourseModel.getTrainCourse();
		Pager pager = this.trainCourseModel.getPageInfo();
		Integer count = trainCourseService.count(trainCourse);
		pager.setTotalRow(count);
		List<TrainCourse> trainCourseList = trainCourseService.queryList(
				trainCourse, pager);

		trainCourseModel.setTrainCourseList(trainCourseList);
		return Action.SUCCESS;
	}

	public String editor() {
		LOGGER.debug("editor()");
		Integer id = this.trainCourseModel.getId();
		if (null != id && !"".equals(id)) {
			TrainCourse trainCourse = trainCourseModel.getTrainCourse();
			trainCourse.setId(id);
			TrainCourse trainCourseReult = trainCourseService
					.query(trainCourse);
			this.trainCourseModel.setTrainCourse(trainCourseReult);
			
			//获取报名学员信息
			TrainingOfPersonnel trainingOfPersonnel = this.trainCourseModel.getTrainingOfPersonnel();
			trainingOfPersonnel.setTrainCourseId(id);
			Pager pager = this.trainCourseModel.getPageInfo();
			
			Integer count = trainingOfPersonnelService.count(trainingOfPersonnel);
			
			pager.setTotalRow(count);
			List<TrainingOfPersonnel> trainingOfPersonnelList = trainingOfPersonnelService.queryList(trainingOfPersonnel, pager);
			this.trainCourseModel.setTrainingOfPersonnelList(trainingOfPersonnelList);
		}
		return Action.EDITOR;
	}

	public String save() {
		LOGGER.debug("save()");
		TrainCourse trainCourse = trainCourseModel.getTrainCourse();

		//判断当前是设置成启动状态还是停用状态
		String view = this.trainCourseModel.getView();
		if(null != view && "enabled".equals(view)){
			
			String enabled = this.trainCourseModel.getEnabled();
			Integer id = this.trainCourseModel.getId();
			if("0".equals(enabled)){
				trainCourse.setEnabled("1");
			}else{
				trainCourse.setEnabled("0");
			}
			trainCourse.setId(id);
		}
		
		// 判断是新增还是修改
		Integer id = trainCourse.getId();
		if (null == id || 0 == id) {
			trainCourseService.insert(trainCourse);
		} else {
			trainCourseService.update(trainCourse);
		}
		return Action.EDITOR_SUCCESS;
	}
	
	public String saveTraining()
	{
		TrainingOfPersonnel trainingOfPersonnel = trainCourseModel.getTrainingOfPersonnel();
		Integer trainCourseId = trainingOfPersonnel.getTrainCourseId();
		Integer technologicalProcessId = trainingOfPersonnel.getTechnologicalProcessId();
		if (trainCourseId == null || trainCourseId == 0)
		{
			throw new ProjectException("课程编号不允许为null");
		}
		if (technologicalProcessId == null || technologicalProcessId == 0)
		{
			throw new ProjectException("学员编号不允许为null");
		}
		trainingOfPersonnelService.insert(trainingOfPersonnel);
		return "save";
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return trainCourseModel;
	}

	public TrainCourseModel getTrainCourseModel() {
		return trainCourseModel;
	}

	public void setTrainCourseModel(TrainCourseModel trainCourseModel) {
		this.trainCourseModel = trainCourseModel;
	}

}

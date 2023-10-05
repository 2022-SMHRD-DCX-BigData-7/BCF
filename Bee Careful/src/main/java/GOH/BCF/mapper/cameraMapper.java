package GOH.BCF.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import GOH.BCF.entity.cameraDTO;
@Mapper
public interface cameraMapper {
	@Select("Select * from t_camera where user_id=#{user_id}")
	public List<cameraDTO> userallcamera(String user_id);
	@Select("Select * from t_camera")
	public List<cameraDTO> allcamera();	
	@Select("select * from t_camera where camera_idx=#{camera_idx}")
	public cameraDTO userfind(int idx);
	@Update("update t_camera set user_id=#{user_id} where camera_idx=#{camera_idx}")
	public void cameraUpdateId(cameraDTO DTO);
	@Update("update t_camera set camera_status=#{camera_status} where camera_idx=#{camera_idx}")
	public void cameraUpdateSt(cameraDTO DTO);
	@Delete("delete from t_camera where camera_idx=#{camera_idx}")
	public void cameradelete(int idx);
	@Insert("insert into t_camera values (null,#{user_id},#{camera_status})")
	public void camerainsert(cameraDTO dTO);
}

package oa.mapper;

import oa.pojo.File;

import java.util.List;

public interface FileMapper {
    List<File> findAllFile();

    File findFileById(int id);

    void saveFile(File File);

    void updateFile(File File);

    void deleteFileById(int id);
}

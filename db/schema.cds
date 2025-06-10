namespace com.tno.courses;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Courses : cuid, managed {
    title               : String(255);
    description         : String(1000);
    startDate           : Date;
    endDate             : Date;
    location            : String(255);
    instructorId       : Association to Instructors;
    maxParticipants     : Integer;
    currentParticipants : Integer;
}

entity CourseRegistrations : cuid, managed {
    courseId         : Association to Courses;
    participantName  : String(255);
    participantEmail : String(255);
    registrationDate : DateTime;
}

entity CourseEvaluations : cuid, managed {
    courseId      : Association to Courses;
    participantId : Association to Participants;
    rating        : Integer; // Scale of 1-5
    comments      : String(1000);
}

entity Participants : cuid, managed {
    firstName         : String(255);
    lastName          : String(255);
    email             : String(255);
    registeredCourses : Composition of many CourseRegistrations
                            on registeredCourses.courseId = $self;
    evaluations       : Composition of many CourseEvaluations
                            on evaluations.participantId = $self;
}

entity Instructors : cuid, managed {
    firstName         : String(255);
    lastName          : String(255);
    email             : String(255);
    bio               : String(1000);
    courses           : Composition of many Courses 
                            on courses.instructorId = $self;
                           
}
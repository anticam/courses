using {com.tno.courses as my} from '../db/schema';

service AdminService @(requires: 'admin') {
    entity Courses   as projection on my.Courses;
    entity Instructors as projection on my.Instructors;
    entity Participants as projection on my.Participants;
}

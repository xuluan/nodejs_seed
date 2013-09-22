'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */

describe('my app', function() {
  beforeEach(function() {
    browser().navigateTo('/');
  });

  it('should automatically redirect articles', function() {    
    expect(browser().location().path()).toBe("/articles");
    expect(element('h1').html()).toContain('Nodejs Seed');
    
  });
  
  it('should automatically 2', function() {
    // expect(browser().location().url()).toBe("/#/articles");
    
    browser().navigateTo("/#/articles/new");
    expect(browser().window().href()).toBe("http://localhost:9876/#/articles/new");
    expect(element('label').html()).toContain('Title');
    expect(element('label').count()).toBe(2);
    
  });  


  it('should automatically 2', function() {
    while(1) {
      
    }
    expect(browser().window().href()).toBe("http://localhost:9876/#/articles");
    
  });  

});

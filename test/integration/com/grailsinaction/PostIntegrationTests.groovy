package com.grailsinaction

import grails.test.*

class PostIntegrationTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }

    void testFirstPost(){
      def user = new User(userId: 'joe', password: 'secret').save()
      def post1 = new Post(content: "First post...")
      user.addToPosts(post1)
      def post2 = new Post(content: "Second post...")
      user.addToPosts(post2)
      //def post3 = new Post(content: "Third post...")
      user.addToPosts(new Post(content: "Third post..."))
      assertEquals 3, User.get(user.id).posts.size()
    }
}

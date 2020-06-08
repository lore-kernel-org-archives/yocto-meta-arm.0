Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.34136.1591633465596055299
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 09:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uq94+1R8;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id d10so8982279pgn.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=/NKVLLh2+VJICLLLfQ6iqHt8GIplKaE+v8p4KCFMAX8=;
        b=Uq94+1R8XVtRWtfrvzvdO14W0Kom2mybxdYelsGVcixqDgeC4MOem4hhCep+GYccjt
         l0YlZXg7D1LtzGItNiht6ydqayNqM9crIA3/6Ozu/q5/SHb/zOA2A2QLKMRyjYrnH2hs
         yyyMQFv/L7YbL7A3rpfdM1Wkcy8g1L05id6HTWCJawK/Sz/EDN3SCy4zDZWcDJm2ghps
         Csq771Z4rjxcZWbxdQjjBaiqrM0z4VjrAOgcuO+pzP/MCs1fqIEblv+r4GThdNLU8H0a
         virdlu/+40JBZ7GmxK09laXpE6yLhmRlQcGE5XWqA/2sUc5AUP+hV4XjvBAQlBgMsPzX
         Juuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=/NKVLLh2+VJICLLLfQ6iqHt8GIplKaE+v8p4KCFMAX8=;
        b=bZ3XB5Ntfg82pZXbHgWVJ9U273Qf8zk4yWs13hjDLBJUOSLytzWFuyqS8zY1c9Lgu5
         c20nEKpJkboyxTrJLPbbu5UFlztfdwGoNd8qwllu0ceIAO1oXZJMGrzxvmTr8LrnaKkN
         OXnLOlpcsGdkiGAGoVQBid9M6n8NRXGfklDciqy1cDvb81jOql+mY/zZW0qQ7H6L68ky
         Kk9CyyLMce+0bSHMJp9Hgn0PSqb3Rg7NLMuvO0siBnu6o8wxB5h45rbGVCBfS45Rz3AM
         lMSayFDMtIxT8Tkyb0IzEcSvsVyv67+x08m8v8YCafrnoeRHqbG2gJByTJxGZh/XtVMy
         Zp5Q==
X-Gm-Message-State: AOAM5309IDJsO8uYJzwQXgZS2AsWrY46isZhWapRXi0LaE5YWA+qI6vy
	VH8kfm70PMZ2ezUx7ufJ9xQ=
X-Google-Smtp-Source: ABdhPJzVYUWW7zmKi413tASELPuaITKCOPfiked0wFtYxsX+JBkoHr40pu7/d7S+QrGp8M5A9OePYA==
X-Received: by 2002:aa7:95bd:: with SMTP id a29mr21812356pfk.57.1591633465005;
        Mon, 08 Jun 2020 09:24:25 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:90db:6d3d:5f9f:7f1d? ([2605:a601:ac3d:c100:90db:6d3d:5f9f:7f1d])
        by smtp.gmail.com with ESMTPSA id d4sm29220pjm.55.2020.06.08.09.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 09:24:24 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] Proposal for the branching policy of meta-arm
To: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
References: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com>
Message-ID: <2bfeafe9-ac99-07fa-65bd-b50432141bc2@gmail.com>
Date: Mon, 8 Jun 2020 11:24:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com>
Content-Type: multipart/alternative;
 boundary="------------4867761A5033EA5E138A118F"
Content-Language: en-US

--------------4867761A5033EA5E138A118F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for this! It all looks reasonable to me. I have a few comments 
below, but they are just clarifications and observations.

On 6/5/20 1:37 PM, Jon Mason wrote:
> Problem
>
> The Yocto Project releases twice a year (April and October): "stable" 
> releases are made every six months and have a lifetime of seven months 
> to allow for migration, while "long term support" (LTS) releases are 
> picked every two years starting from Dunfell in April 2020. The 
> standard practice for all Yocto Compatible layers is to create a 
> "named" branch consistent with the code name of that release.   For 
> example, the “dunfell” release of Yocto will have a branch named 
> “dunfell” in the official git repository, and layers compatible with 
> dunfell will have a branch named “dunfell”.  Thus, a customer can 
> easily organise a collection of appropriate layers to make a product.
>
> In Yocto, these named branches are “stable”, and only take bug fixes 
> or security-critical upgrades.  Active development occurs on the 
> master branch.  However, this methodology can be problematic if 
> mimicked with the compatible layers.  Companies or open source 
> projects may not wish to release a snapshot of the relevant “master” 
> branches under active development, due to the amount of testing, 
> fixing, and hardening necessary to make a product from a non-stable 
> release.  Also, changes to keep the master branch of a layer working 
> with the upstream master branch of Yocto may result in that branch no 
> longer being compatible with named branches (e.g., it might not be 
> possible to mix and match master and dunfell).  So, a decision must be 
> made on the branching policy of meta-arm.
>
>
> Proposal
>
> There are many different ways to resolve this issue.  After some 
> discussion, the best solution for us is to allow new features and 
> hardware enablement to be included in named branches (not just bug 
> fixes).  This will allow for a more stable software platform for 
> software to be developed, tested, and released.  Also, the single 
> branch allows for focused testing (limiting the amount of resources 
> needed for CI/CD), lessens/eliminates code diverging on various 
> branches, and lessens confusion on which branch to use. The risk of 
> making this choice is a potentially non-stable branch which will 
> require more frequent testing to lessen the risk, and not following 
> the “stable” methodology of the core Yocto layers (though it is not 
> uncommon for BSP layers to behave as we are recommending).
>
>
> Process
>
> The process for patches intended on being integrated into only the 
> master branch is the normal process of pushing to meta-arm mailing 
> list for community review, approval and integration into upstream 
> meta-arm master branch.  For patches intended on being included in a 
> named branch are also the normal internal process of pushing to 
> mailing list for community review, approval and integration into 
> meta-arm named branch.  However, any patches intended on being 
> included on a named branch must also be sent for inclusion in the 
> master branch in a timely fashion (no more than 1 week after inclusion 
> into the named branch).

Just as a note, this is opposite of most other layers where it's 
required to be in master (or shown to be inappropriate for some reason) 
before it's backported to the release branch


>
>
> Branching strategy
>
> Named branches for meta-arm will be released as close as possible to 
> the release of the YP LTS release.  Meta-arm named branches will be 
> created from the meta-arm master branch.
>
> To minimize the additional work of maintaining multiple branches it is 
> assumed that there will only be two active branches at any given time: 
> master and the most recent Long Term Stable (LTS) as the named 
> branch.  All previous named will be EOLed when a new LTS has been 
> released.   Any branches that are EOLed will still exist in the 
> meta-arm, but patches will not be accepted.
>
>
> Branch transitions
>
> When an upcoming YP LTS is approaching release, meta-arm will attempt 
> to stabilize master so that the releases can coincide.
>
> T-6 weeks - Email is sent to meta-arm mailing list notifying of 
> upcoming code freeze of features to meta-arm
>
> T-4 weeks - Code freeze to meta-arm.  Only bug fixes are taken at this 
> point.
>
> T-0 - All bugs are fixed and layer is stable, new named branch is 
> created based on master and no new patches accepted to any previous 
> named branches.  Master branch will start accepting patches again.

You might clarify the reference point here... is T - 0 the date the 
upstream release is approved for consumption?

Also, upstream OE-core makes a named release branch before the actual 
release so it can start accept patches to master before the actual 
release date (I think in particular because there is an amount of time 
were the release is undergoing QA and they don't want to block patches 
while waiting). I don't think you necessarily need to do this, but you 
might want to mention it because there will be an amount of time where 
"master" of meta-arm will actually pair with the release branch in 
OE-core (instead of master), which might be confusing. Finally, some 
might misconstrue T - 0 with the creation of branch in OE-core (hence 
the first comment).


>
>
> 

--------------4867761A5033EA5E138A118F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Thanks for this! It all looks reasonable to me. I have a few
      comments below, but they are just clarifications and observations.<br>
    </p>
    <div class="moz-cite-prefix">On 6/5/20 1:37 PM, Jon Mason wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com">Problem
      <br>
      <br>
      The Yocto Project releases twice a year (April and October):
      "stable" releases are made every six months and have a lifetime of
      seven months to allow for migration, while "long term support"
      (LTS) releases are picked every two years starting from Dunfell in
      April 2020. The standard practice for all Yocto Compatible layers
      is to create a "named" branch consistent with the code name of
      that release.   For example, the “dunfell” release of Yocto will
      have a branch named “dunfell” in the official git repository, and
      layers compatible with dunfell will have a branch named
      “dunfell”.  Thus, a customer can easily organise a collection of
      appropriate layers to make a product.
      <br>
      <br>
      In Yocto, these named branches are “stable”, and only take bug
      fixes or security-critical upgrades.  Active development occurs on
      the master branch.  However, this methodology can be problematic
      if mimicked with the compatible layers.  Companies or open source
      projects may not wish to release a snapshot of the relevant
      “master” branches under active development, due to the amount of
      testing, fixing, and hardening necessary to make a product from a
      non-stable release.  Also, changes to keep the master branch of a
      layer working with the upstream master branch of Yocto may result
      in that branch no longer being compatible with named branches
      (e.g., it might not be possible to mix and match master and
      dunfell).  So, a decision must be made on the branching policy of
      meta-arm.
      <br>
      <br>
      <br>
      Proposal
      <br>
      <br>
      There are many different ways to resolve this issue.  After some
      discussion, the best solution for us is to allow new features and
      hardware enablement to be included in named branches (not just bug
      fixes).  This will allow for a more stable software platform for
      software to be developed, tested, and released.  Also, the single
      branch allows for focused testing (limiting the amount of
      resources needed for CI/CD), lessens/eliminates code diverging on
      various branches, and lessens confusion on which branch to use.
      The risk of making this choice is a potentially non-stable branch
      which will require more frequent testing to lessen the risk, and
      not following the “stable” methodology of the core Yocto layers
      (though it is not uncommon for BSP layers to behave as we are
      recommending).
      <br>
      <br>
      <br>
      Process
      <br>
      <br>
      The process for patches intended on being integrated into only the
      master branch is the normal process of pushing to meta-arm mailing
      list for community review, approval and integration into upstream
      meta-arm master branch.  For patches intended on being included in
      a named branch are also the normal internal process of pushing to
      mailing list for community review, approval and integration into
      meta-arm named branch.  However, any patches intended on being
      included on a named branch must also be sent for inclusion in the
      master branch in a timely fashion (no more than 1 week after
      inclusion into the named branch).
      <br>
    </blockquote>
    <br>
    <p>Just as a note, this is opposite of most other layers where it's
      required to be in master (or shown to be inappropriate for some
      reason) before it's backported to the release branch</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com">
      <br>
      <br>
      Branching strategy
      <br>
      <br>
      Named branches for meta-arm will be released as close as possible
      to the release of the YP LTS release.  Meta-arm named branches
      will be created from the meta-arm master branch.
      <br>
      <br>
      To minimize the additional work of maintaining multiple branches
      it is assumed that there will only be two active branches at any
      given time: master and the most recent Long Term Stable (LTS) as
      the named branch.  All previous named will be EOLed when a new LTS
      has been released.   Any branches that are EOLed will still exist
      in the meta-arm, but patches will not be accepted.
      <br>
      <br>
      <br>
      Branch transitions
      <br>
      <br>
      When an upcoming YP LTS is approaching release, meta-arm will
      attempt to stabilize master so that the releases can coincide.
      <br>
      <br>
      T-6 weeks - Email is sent to meta-arm mailing list notifying of
      upcoming code freeze of features to meta-arm
      <br>
      <br>
      T-4 weeks - Code freeze to meta-arm.  Only bug fixes are taken at
      this point.
      <br>
      <br>
      T-0 - All bugs are fixed and layer is stable, new named branch is
      created based on master and no new patches accepted to any
      previous named branches.  Master branch will start accepting
      patches again.
      <br>
    </blockquote>
    <p>You might clarify the reference point here... is T - 0 the date
      the upstream release is approved for consumption?</p>
    <p>Also, upstream OE-core makes a named release branch before the
      actual release so it can start accept patches to master before the
      actual release date (I think in particular because there is an
      amount of time were the release is undergoing QA and they don't
      want to block patches while waiting). I don't think you
      necessarily need to do this, but you might want to mention it
      because there will be an amount of time where "master" of meta-arm
      will actually pair with the release branch in OE-core (instead of
      master), which might be confusing. Finally, some might misconstrue
      T - 0 with the creation of branch in OE-core (hence the first
      comment).<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com">
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4867761A5033EA5E138A118F--

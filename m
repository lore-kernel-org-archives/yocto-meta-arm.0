Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.5430.1589424003536223662
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 19:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FXACQPL5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id y22so1650343qki.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 19:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=sFI+yqXKnNfFRxu99gdSaw0ErmYjdk/b0sQUo4EX4O4=;
        b=FXACQPL5BOSRXiWoCs6MpOSC+iHDrkhoiqft0Rqo9D8WiT5Jpa5juYnAeEvZJHg8JQ
         1MTD7lcX1q+qgayn1oAwAB9KTvqZ/bbBJ9SmOiJMLAhDZhaZdhYAc65guPh7We78S7dD
         U0SiVTNtSJ5n4+1nB3jX7Y6OtYLSHc+sQ2Bs7IPO0cptEAFzOlB/u7JVOPb7fpWzKN9h
         uJY+Y6EPl8iyD4CbTUNqvxW2rLE1YXqGZDhzFmS3TZMg5n0/LUceQOw3ii4pMCVbXVeB
         zFCocO/8r2/mgrsvA93UZT8rJ++vjdcNrRKK+Hvhgjq8PhVWtNB+qYgyL9QuM2OAqnl0
         wdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=sFI+yqXKnNfFRxu99gdSaw0ErmYjdk/b0sQUo4EX4O4=;
        b=gawo99prwaECsF1o2OilwOeoBXEg5axEWaCJAI/6/GNj0zMGLJHjnVJWXLEDveDo4q
         qPvY9344xbh+S2tUIT2B4pzU/R7WSduioWyuQXOQpGUHUL2/DbNbMggwY8+YHYUE0Ft0
         ztPdEQRnBwupCGc9dEM96H09BNLRjyc30IU19Y/eNFvveyhe3q/Ne8LWAzrjuSeVUSBH
         g5p7lm/jNAAEj1y0omgvURrsl06BRewHe4arp8iT4b2aTOhHl943MgvoLow6BUXhfS5C
         5q61R0+yeKQ6CewLWmhaVzu9nHKwx8FEZf4hE6FtLDhtxKudUQpP2sR6wkDQP++KhIDG
         VJKQ==
X-Gm-Message-State: AOAM531DKa+yc7xBzUXzZUIpKilwG6JdxpN7weuA1NSyd4Q3HxCMJb91
	9mLnrFHFAFPRadGuk1ig5CmtgOBuFLcsoA==
X-Google-Smtp-Source: ABdhPJx5Pv9h86oE2F6VPNzlTVWQIT/crvKPbQL81IGiKlGKxTXi3zZajAGy7SX/c5nxyqdDJ43M2A==
X-Received: by 2002:a37:acc:: with SMTP id 195mr2713908qkk.419.1589424002391;
        Wed, 13 May 2020 19:40:02 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:658c:9d8a:81ff:d57])
        by smtp.gmail.com with ESMTPSA id o67sm1613326qkc.2.2020.05.13.19.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 19:40:01 -0700 (PDT)
Date: Wed, 13 May 2020 22:40:00 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: GNU Arm Embedded Toolchain recipe
Message-ID: <20200514023959.GA10245@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There are a number of recipes floating around inside and outside of
Arm to support the GNU Arm Embedded Toolchain.  Specifically,
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
https://git.yoctoproject.org/cgit/cgit.cgi/meta-rockchip/tree/recipes-devtools/gcc-arm-none-eabi/gcc-arm-none-eabi-native_9-2019-q4-major.bb

After looking at the website
(https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads),
the latest version is 9-2019-q4-major.  Given this, I think the best
approach is to simply import the recipe from meta-rockchip into
meta-arm-toolchains and use that is the starting point.

Assuming everyone is fine with this, are their any other legacy
versions that are needed by other layers?

Thanks,
Jon

Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.18677.1617378443129407884
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 08:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EgZPJl9E;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id 1so4003390qtb.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Apr 2021 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=poL2e9vLGT5XjaqcQ8SLAgmCDGXwacCuyQA6wJxSE8M=;
        b=EgZPJl9EpXGCEdxd2TRVrXmqaT6MKLvH7q1AJT0iS1fHhjKt/32haALihS1ji6w+8d
         VBhwejla5n6iUcmixHfoe1vjO83yx/bIZ0b/GGGfpg/ypklREZ2gj3fzQFvSdrse5WRn
         V/XHcdSSTG8aSrDTENZQxkKtotUsldQhnQQ/PRqV2CCZ5jig9JJOrBWyWgrwaCwLv3cG
         H/ySmv8umv+/iOsiIoBetgzog01KEidY/Um4JTzl/WFwiCcHCCnCO7MW+ntGjTYB1Bq5
         SjvNFW93lI/RADPU+s7q2xwn2SenNZ37OkaNQ5K7LiHXZqgZsYt68lwDMXA2r9M7/cAa
         oceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=poL2e9vLGT5XjaqcQ8SLAgmCDGXwacCuyQA6wJxSE8M=;
        b=SvdWcugWL+YnLVXfoMUBNt7lTDmoN4j29XHAnv3G8TpDyhqC/eMqM4HdBVrsAcvjWI
         dr91qxf+XY3gO3D7kEA1AfTCI1k9HA/vZ3HSxOr8PIruLH21q8KKyLnH33rYug2x13qH
         XN/KxZ8C84V94LXKLFYU906XwPtk+d/zFiZsYrOHOb/u3g5qxMhUVK4YVV8DPGR7KJvR
         YDHu2c6byfacUeQ2V/PCajzTZJUsKpeMOattjgsdTLlez8aLs5fPx25sd9A2HkfDyxMK
         6+qVUX4OVj1PLA8hj2ohRdoQbCLDtXLZtpNv6G0XQ4XZjtVlKMFf0n04+XH4M9kqW1M2
         mhpw==
X-Gm-Message-State: AOAM532IFSak62p7f9WBJiCJD6KAASvfReuvILbOdIcJLr9LdeaN2042
	W3NG4ejhET7vbW7agJye88WPYDCzm75PCA==
X-Google-Smtp-Source: ABdhPJzAmFV/W1lVIMjp5p32pjFUrbe4FE77XE7aLpp1yenH5Wpl7Y//t8jnLpAf1rWNbi68RDe0wg==
X-Received: by 2002:ac8:4e4d:: with SMTP id e13mr11964003qtw.169.1617378441262;
        Fri, 02 Apr 2021 08:47:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:995e:34b5:8e34:d202])
        by smtp.gmail.com with ESMTPSA id p66sm7706516qka.108.2021.04.02.08.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 08:47:21 -0700 (PDT)
Date: Fri, 2 Apr 2021 11:47:19 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross@burtonini.com>
Subject: meta-arm hardknott feature freeze is today!
Message-ID: <20210402154719.GB5054@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Per my previous email, today is the feature freeze for the hardknott
release of meta-arm.  We are scheduled to cut the release the 30th of
April.

Thanks,
Jon

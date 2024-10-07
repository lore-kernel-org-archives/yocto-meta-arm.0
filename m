Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9853CED248
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 22:20:39 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.5029.1728339631990583807
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Oct 2024 15:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UNokUsgk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4583068795eso47387081cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 15:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728339631; x=1728944431; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GxPM772VaeM7QGsDEwL6N/Zj7adMMuE+LAOARENtBEU=;
        b=UNokUsgke7ir5oM5yox/BGauPcyuuM25Axmk/madm41GuO2xTQc4PpZLP3MMAfwXvx
         0+2YvtCUcxsHsFH1lsqdWmoCkzDqZ1WKJFLgyfTfsxiwYDLn8ILNeOQok+DlfFojDY9t
         omcecZ49A9+9Rc3RXMFnbDn1Ua7Cuk9KaMFxlhFAqgfWtLLOcTdq+OsmoaMPMruK08oa
         h1k9QvzkHJxsFrTTXHkPbd5UooHaENODuovMvP7egbiSIBnsRUKK8bmXdG8ohWQDXX1D
         lAsZIw0jGi9KSvrD051oJajjXiCgYrnCDzxHptzJqOP+kyKluPFf2jj5u/73t0Luv49g
         NIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728339631; x=1728944431;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxPM772VaeM7QGsDEwL6N/Zj7adMMuE+LAOARENtBEU=;
        b=endkvdQyVWDb2OKtuOX0AfdQflEX40De9G9295zm9R2VV+DGuBdgdVmolOotUw/Ygz
         DMIEOv/aaXR36X6tGzl4oMccgDxn1lZXgGDboqDJ1AzUl42KlbBUcQRzOlXy+yhC88dA
         VPx1rX6f9bL6ndz5akFDGtVEVHdPNjj+r8z/A6DSq3FW06C8SIbDw1jwgYfz54bV3bTA
         BoU3yoYdQYPKwqdgAX55Tm85/eqHlxEFhdjHi7gP3p2uBQ6sI98jK1q/OdinDr3s9mo/
         TTGoYNRR7o0u02R52qpOTrh1oJoLr9N3x27vNeFkmC5ObaNXd4XAm18Uho4mBu+UdtHO
         IdHQ==
X-Gm-Message-State: AOJu0YyPB1ON6JlOfx9XCZgEA5GDVQ0jilAx4qBW544uZ5QVO502NYeY
	CoBLk9J5t2Vg7VfxwWoTXNPacfEWYeO8DJzMVkIXO6Yf1+BDfqN1I2P/L+qWl1DzVkt+GRCFKCw
	=
X-Google-Smtp-Source: AGHT+IHsqx7vplMhZ8/zO1zUpBPrOXwLUXZS5yF24JiiSF9F858yuz5xpTsF0Z+vJUb38huPoIelgw==
X-Received: by 2002:ac8:5fc2:0:b0:45b:5e8d:981e with SMTP id d75a77b69052e-45d9bb45eb0mr250487001cf.54.1728339630752;
        Mon, 07 Oct 2024 15:20:30 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da75ed2e6sm30650381cf.76.2024.10.07.15.20.29
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 15:20:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 7 Oct 2024 18:20:29 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm kirkstone update
Message-ID: <ZwRerYI32VA7b0hV@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 22:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6180

meta-arm has released an updated kirkstone support tag, 4.0.5.  The tag 
contains 3 patches from between 08 May 2024 and 02 Oct 2024.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.0.5) with a yocto-x.y.z tag (i.e., yocto-4.0.5).

Thanks,
Jon


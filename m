Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4E5CED245
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 21:59:39 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.4514.1728338371494057379
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Oct 2024 14:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0mNPpzgc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb3bbb9cf5so44629656d6.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728338370; x=1728943170; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f4X7uiLg4ZUhp4345zJWZIVLaWrqk5YLvi5UrQCNss=;
        b=0mNPpzgcXhvEwVU0U9bLEtwoVtra/70IlY778QNhhRFr2SpCqCyhfGZD50eLN3XbfO
         xb0gSj9YIqvQ3BTZDxfPHE6wTyGu61OtMksKNlV/nZ1CnC+vO8fgr/cFyluM0yLvGhzs
         kvCP37atTshXZLKhZC8XdFARU4SVhqMi1oVzqsqRrbGQ8r1B0faUuuy2us8DsiggpNWj
         nN7GsLTHYfXrgO0sZJSAJLGQtOOYEsTChcjrSmjQCaP6chkKqvPf5KqFRTHi4ePb71lC
         NFjKYk0XyFMJM9P0Mu6r4koBi6pVZOLtv/2YRvmHbrzid+ZCqHXLLNk0sNAYJtSh0+ex
         bwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728338370; x=1728943170;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f4X7uiLg4ZUhp4345zJWZIVLaWrqk5YLvi5UrQCNss=;
        b=erDZjnpXtTkWkpxDqX09S+fvA+YOJBqN8JoUuoQ2DpbLUxKXsUCHmRVzLFdbPJwlzE
         8BufBrl04nud2wdYfmrmTHzTlA84ZsVdGrovoaJWtAQOoM+SHXlgjMgHOClL1JgpR2rg
         WfnmzT81SuG2hd+2kVLBLqUUvfxvYcZ4h10BrQ0l2PC3u2JE2pxB3b6extg6utN5HIx5
         VKMpXTODjk6RNgOPrEdtI/O0EyOD+zfQ9GIJlEAw9LyCpcXlEL3h2qOU0p5GPWQZ0GOC
         hX50aDsyrSLl8+SRkfV0mzylUDfFYlBSuG1EEC5TiKj0LAITxhkGyJ2znQlcTSw2/1+F
         CWbw==
X-Gm-Message-State: AOJu0Yzw5sKOB3b2T1tnOJteSnVfSRKYs3IpMCTRNQOyv/ybS/EBhnAu
	yzjNJ/kbMQD3gqhdqI35kYnU3VP8OOpLUu4hxaLvsLDMqgVXfIVwvRt+8nNohqfgWD4HLKMt4cU
	=
X-Google-Smtp-Source: AGHT+IEssvJr/QAddqo+F75evUUnTLu9ZhmhY0NEG6QimyOd9UD3ZJ7dkK+dUQbTaf0KRO2gWVUg0A==
X-Received: by 2002:a05:6214:5706:b0:6cb:1006:e9de with SMTP id 6a1803df08f44-6cb9a471d46mr229443996d6.41.1728338370125;
        Mon, 07 Oct 2024 14:59:30 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46efec2sm29599036d6.74.2024.10.07.14.59.29
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:59:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 7 Oct 2024 17:59:28 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm styhead release
Message-ID: <ZwRZwBFQwg3Jyc76@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 21:59:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6179

meta-arm has released the styhead support branch.  The branch was 
forked on 07 Oct 2024 from the master branch and was tagged as "5.1".  The 
tag is GPG signed and my public key can be provided if someone wants to 
use it to verify.  Per the previous public discussion on this list, 
styhead will only be taking bug fixes and be passively maintained
(with scarthgap being the actively supported LTS).

Per an external request, we have duplicated all existing numbers only 
tags (i.e., 5.1) with a yocto-x.y.z tag (i.e., yocto-5.1).

Thanks,
Jon


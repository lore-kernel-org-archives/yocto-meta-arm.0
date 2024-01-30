Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A610C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 11:33:56 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.16232.1706614427738185431
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jan 2024 03:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Q1h83m02;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.43, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-214c940145bso1849286fac.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jan 2024 03:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1706614426; x=1707219226; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTlLrTBHXKez16Vm1IikHR1UQ7S8blqqx52kMCRzIzs=;
        b=Q1h83m02v/Ru8UgpomBKwIY8nVliKZVqp8aBc2AMe1kLZbyBNsjIO7F1j7FYtV55vm
         r9lm+jF+Difc/YHd0r7CBTPi3m1O3vWDhaexIn9HaUevUdY6BJwwpGyJzVcvONAQzGb1
         CHkxHpvSC3kU4NE/LxzSpb/DwT3ZE7oaI7tfhMytbCmKS6y9fACndpH+78YVxRjBllj9
         AsxcRX5o731GpbzTmPka9+LIiXAgtPt3qc9XnnJnJi+283FBlua3l0pDT/PG6wGHbctl
         7aIhG2IfhYuh4LpVUfRoNexqTdEF/sQfqXTVzs17eoomNAnXLeOfJHl9kHafQJlF33sF
         hEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706614426; x=1707219226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTlLrTBHXKez16Vm1IikHR1UQ7S8blqqx52kMCRzIzs=;
        b=fI3RPmVOj548JAiviIchwrVTklPsnEE81GGJIXH+Y9CPcMIPoEJdKuTw8PdeZIQ8NG
         5yVA7lmV8CmSBVPsEFL9xw0HAoGhtTkYzvCFKJD8AFvyLPfTFf7RoaMn+EfcefqcU8P+
         kwTKDUsuKaDrGsnbrZ5p3R4jThYiJSVv64yqKS5/AUuKLWG+JWGWI3CkzH56pfTlTKlS
         lVysBFDuMMZQpSCtBUE6IJyQOlfNUuq0FYgRpa9RLflTc8gczOK0jIeKuD0eXM5WO2O1
         gQ5mnplLBXWxUW78MQx0UK9SYHBcYiwA5nrWKXtdwwETToYMEXiDE2KflMzcJQUdWR/2
         WUqQ==
X-Gm-Message-State: AOJu0YwdxFwwiepIw4GqXB9gpbeffUUiwTgHaZ0JG4fvBfKa79USUlX3
	bXp1PiyFrhOamo5eF8KPKei5+ZOjfz7u/YLovf915Zev+AmiG2btinik3uRjVBt8XtC5f+jUle4
	Mrg==
X-Google-Smtp-Source: AGHT+IF7qsGSnMB2DPMPjTC+H0b2TS+D1ldPEExoVj3T7PKn+wTLM7czhsSr+P1Fx6tJCM6wPBY41A==
X-Received: by 2002:a05:6870:d0c2:b0:218:3f9a:78ca with SMTP id k2-20020a056870d0c200b002183f9a78camr5161177oaa.23.1706614426177;
        Tue, 30 Jan 2024 03:33:46 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id hh10-20020a05622a618a00b00428346b88bfsm4381301qtb.65.2024.01.30.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 03:33:45 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH 1/2] CI: add explanatory comments to variables
Date: Tue, 30 Jan 2024 06:31:56 -0500
Message-Id: <170661431652.3168730.4324202923617156931.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240129181401.2170364-1-ross.burton@arm.com>
References: <20240129181401.2170364-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jan 2024 11:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5371


On Mon, 29 Jan 2024 18:14:00 +0000, ross.burton@arm.com wrote:
> 


Applied, thanks!

[1/2] CI: add explanatory comments to variables
      commit: 8b94fee2058d52ef450508ba1dde0e1df2d08c12
[2/2] CI: allow the runner to set a NVD API key
      commit: 60202ad84d3d3531e79107a8281ef3502ccfa156

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


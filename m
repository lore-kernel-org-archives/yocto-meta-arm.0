Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A79C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 04:23:37 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.41094.1747974210194388035
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 May 2025 21:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Cqowf2QY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e39d1db2so547688885a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747974209; x=1748579009; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wm1NyNfwIV0/pLo6BDmyRg+ymHloMX3paNR2VgjsNA0=;
        b=Cqowf2QYrrMM+MMxkY3iQWVLgFBeRnqL0+8BGbonHwGLcog3vBY70ZBN2wLKh3zEmR
         7pgitE7+QJgGoij/WKM/+Wjx3lahOYD2zHS+S0Vfa2wdmHEA6s8UIpIh+rU/2zgaeJgN
         YsGhBsSYPnJOUKnwrfFhjtb5MZzCZQ8K6kyZNQjKirxpDR7+tDYUGgqrK94bHutlOCiI
         CBdXC0iOjBhRA7otFWi3aAtsbcytrh3i2C6hgJg5BsyaQc1mL+viVKisxGHmd/j4WM7V
         ckPcIsEawX54V4SDv4f29EH5FKFKppD+YHVH2xAl76RHlMWzG3ysfa77CO99ABtBfAL5
         oWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747974209; x=1748579009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wm1NyNfwIV0/pLo6BDmyRg+ymHloMX3paNR2VgjsNA0=;
        b=d7i9Fyqi4KtUAUkBTcJbVsgds54FLZWyPPFitcluB4d+DHf86RQ0Gkg9kKDnK19HW6
         z2OScxUTyVRnEhoJf76WfYSdmDW5xXaSCf3hKQypdypHKAaQGZaxboBG3vK3mTIIkqD6
         ftUN4O9r+4ZDyGwbYFiqqChMtI2+pQYwfghJGeFV9ewdAuXht1tV0LFGeRk3NSZrZBs3
         hFOhKFja2jiz/yXlNEm3JTmEOLQVbuAqvZBZ32HGPAe7PppGfukTyPj89dhvuQgzA2NL
         Q2gt15umHmMgFQQhHH2jJBqW9iYl7vvCsRUCDJLyFwPPMXVdR30FbDylOJxT+BRxYIHV
         4lNQ==
X-Gm-Message-State: AOJu0YzYDvnC1O9HbZ7WoguiwL0p+7VENUgmfZvunEig3waNZMKEpQwd
	zqI6FLp4kmtbfwlmL4AkXOXymCGbU9I+Iv5FOjRvu+2gchCaFgY+vRzbHIUI+nqWyWSJpZHEhbN
	GuY6DdQ==
X-Gm-Gg: ASbGncvxQKQ5S1k6eRJwPT/n/S1yn97gvGZ77dN9SB9S8Nr2kGvSxT2pjXsKJu3+8KS
	24o/3RxCIKmjy6tW/Ly2xt4L2a1yF979OOTQN6IPgloNvFi5hk2KVGFHrBK1OcWHPsueF4G/Jcf
	EKMyZJEIXFN2I6xSb4VC0pvBoadY5X4uSxzkElo4AUCFMTUfI5HdnQqGotnz2D6D39zNcTOrrWH
	mtqBnA154MnmU9LVDUHSbGh4Iu8/YxYsH1QaOGP1ysiletwiuFxeuupFlliV+ScEa669TUA/5Hm
	Ei1xQGlFyLUioOPIb4uRPo621nWVReG4ES/1sFNP7og=
X-Google-Smtp-Source: AGHT+IELv0SLPvfwpm8MATw3iYjBnPrZ3L9+/K+fBF/C691ZVh2aYy42G3G+FrQzRAjAisxymfHFNg==
X-Received: by 2002:a05:620a:244f:b0:7c5:55f9:4bb2 with SMTP id af79cd13be357-7cee31e7b82mr232523685a.22.1747974208906;
        Thu, 22 May 2025 21:23:28 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bc7c4sm1122035985a.23.2025.05.22.21.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 21:23:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gyorgy Szing <gyorgy.szing@arm.com>
Subject: Re: [PATCH 1/9] arm/trusted-services: update to newer version
Date: Fri, 23 May 2025 00:23:15 -0400
Message-Id: <174797419805.2415316.187686063437709611.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 May 2025 04:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6521


On Tue, 20 May 2025 19:27:39 +0200, Gyorgy Szing wrote:
> Bump the TS SHA to latest integration.
> Set the version of TS dependencies as required.
> 
> 

Applied, thanks!

[1/9] arm/trusted-services: update to newer version
      commit: 3bcd88c8cf6e272c74d15af8d37fa1489d0731a0
[2/9] arm/trusted-services: drop newlib
      commit: b1cd63a320dcac792d44490546996094ff052e53
[3/9] arm/trusted-services: add libpsats recipe
      commit: 4884f787a2bd0ef8a214b4461683de90c7d891b0
[4/9] arm/trusted-services: simplify SmmGW configuration
      commit: ee46a4157894c00080cf5777b6f0ea688febd790
[5/9] base-fvp: enable branch protection in firmware
      commit: bb741b21e0d0d3cf491ad5bc6e267f1d6155e9f9
[6/9] arm/trusted-services: enable the logging SP
      commit: ca9e11908334acd4296ac5247a35d794bede7293
[7/9] arm-bsp/trusted-services: corstone1000: rebase patches
      commit: 6d4170bd1d67ee90aae7ef18f58ed7d08f767491
[8/9] arm-bsp/trusted-services: corstone1000: revert features that conflict with capsule update
      commit: 2efe72141cae64ec36bd17f2401bb4f7fa3da11b
[9/9] arm-bsp/trusted-services: pass MM_COMM_BUFFER_SIZE to the libts build
      commit: c65c3258191aa971803265b8e90789ed46fd3eab

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


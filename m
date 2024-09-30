Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C24CE836D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:42 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.59013.1727713533303898446
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PrQbVpPD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.178, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1d06c728b8so4059983276.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713532; x=1728318332; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siKp5wnGNKFXuPM4PI7rq+QwBX03+XZXsXrbdSGepMA=;
        b=PrQbVpPD87TOI9zfBPSgY/kRBysEqGCHWjqht8IVMN0fTpjxGNicBd18FxO55J0nIg
         an4132yROoS1Sa6+iBORN21wnfj4G0OCegzG3Zk4AYj77KI5YqQ6hwoa6hX6idZUCC5k
         AInvOzzKdaD6xR3IcNSnry9h45UTKLwLjUHBL0MGdi3ftUXrd8ntCoYaGKw4UIfs7nh6
         JP9D4tNBpjddb49meGDQ8UufEsUlNBJLn6G2Jc/DDHccG5NR4TDM18VwBzI26CzAINPP
         v/bZyyy9rX1PSaOfn7gcyp9N9XlVeIZlCJvewWhTvdz9Pcnz+XP6OYp+pBeUqmwZVu61
         bN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713532; x=1728318332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siKp5wnGNKFXuPM4PI7rq+QwBX03+XZXsXrbdSGepMA=;
        b=o2uKmuEwl+ghTG5oBXJJstE2ZqWpAW3pi5kp9Sr3nbwUyl90Z0wZPdl7GQmBYQ3J0+
         bmSRmayvOH5yz2aw9ht7mbvoEpkdkneyCjjiW1+0OcxQUP1IlNI1a74S8aA14fMccBko
         QlpZhqSMHs3toEJhB3FswmkeoiknucXlCZt/gbMDMc6tMTAb3XVa2cDLstxs7TtX6Tlk
         ffsA9TBIn20nrCrg70aCriRbqxHwDCGnPi1+ITLKYEB+BSqWFmp6VYj40gBARloY+MPV
         4zVO0Lna1IbU9Sd1zX08JEV8RlH3vDC16uAui3mDKcM48unndUH7zL3N+Y0iWlekRcxx
         YzyA==
X-Gm-Message-State: AOJu0Yzqp6nT/x8ISfDIy4JnekouPY0IpwvnHB9uUEhGPXdFiJdeoX2R
	NsTKb23IXO+A8dzxA9ccuK5QP4vAVSm36e7eddIwaWUoKq5C1+OOZ62l3y2vBMnbycPg//up5Pw
	=
X-Google-Smtp-Source: AGHT+IE3yOLC5dWio/pepmLjUqDTlToeQiSxKKHYzdSqCIjeK2b/+rGEZWfcja9lO4P68qA5XIMk1Q==
X-Received: by 2002:a05:690c:6f91:b0:64b:5cc7:bcbc with SMTP id 00721157ae682-6e2475d12bbmr110424067b3.32.1727713532252;
        Mon, 30 Sep 2024 09:25:32 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24531602bsm14682887b3.55.2024.09.30.09.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:25:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] CI: add KAS_BUILD_DIR variable
Date: Mon, 30 Sep 2024 12:24:40 -0400
Message-Id: <172771348141.724488.7171256801534061313.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927155705.1121586-1-ross.burton@arm.com>
References: <20240927155705.1121586-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6147


On Fri, 27 Sep 2024 16:57:03 +0100, Ross Burton wrote:
> Instead of always using KAS_WORK_DIR/build to refer to the build tree,
> on the assumption that is where the build tree is, export KAS_BUILD_DIR
> and use that variable instead.
> 
> 

Applied, thanks!

[1/3] CI: add KAS_BUILD_DIR variable
      commit: d96bebfdedad3a374d61c6979b68b8b2da4b0d87
[2/3] CI: remove duplicate arm-systemready-ir-acs
      commit: 8696545747028c51b76e1921478987a790168165
[3/3] CI: transform testimage reports into JUnit XML reports
      commit: f22852b3531ac33476e93fe8a3c9c0111866b06d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CF7C369CF
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 03:15:59 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.344.1745032555384041883
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 20:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=tlkJvQRk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5aecec8f3so368848285a.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1745032554; x=1745637354; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJCS13ABQ0StFTe1NvDbXe1j5ZTd9wF8a1oEX4YwhME=;
        b=tlkJvQRkiYMkgF5IyH9vQqBWtlzfjpz+Ah0jyTUknR5lt0MIowlQFLoss3nySuuOqb
         ok5co367CsLpPV+3/0GjJW3pphgTPDmQniEiBTdRDXNz6RsL/KJtzXWhDElBQHv739OD
         zMdEnbB6zbVGCwb/paR5NUT/YcKmAV18PyN0VhFJwXUnR+8E93Jx0wMMkmVMUb7ydPZh
         ad6zNzRUi6Tuugk83i6G4iAkdiVvw1h83tvnlOQbLQ810Gw3Jh/MfW9lktOEbEOJWWQF
         co6DtET5CbfJG/OTKV87FqdsYG/AUUy6CGTw7MY1OOa3uI8LI/XAgCZGw/JdOC1W69IU
         wmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745032554; x=1745637354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJCS13ABQ0StFTe1NvDbXe1j5ZTd9wF8a1oEX4YwhME=;
        b=SBZ6sQxMPlUhJQIL/yqEQmpVGYSP3O736RUzgkUkQwPq/wVnAyODRlleYPsJlQCQDh
         otGr7yN7EvwachrncJBpqvmqM8Mdm/oj2nzY1Sls7igQn1ROfBVY3niAMw62apG7AHF+
         hfkWpdBbrcNCgTLlYQIqBZg8CeTypPKH4al6rdSGMrkbqFKEet2aqbKN9zhoxFmdUA89
         xuC95EkJncWqHmeYjV0AKIurJwHjzShNK9uAbkyt4q6sMrxMYRrhDAVzvb7Qvfjb7slI
         xWwDNTLPqkdQp7YwAWj4t0HXfTWFZj46qPAoVDwgJMUHe6YzR4EC8YQVEdY0q03BFzKj
         f/Gg==
X-Gm-Message-State: AOJu0YzAUJg/XvteuVNaWEUTVTXcQx7e1JHqRyxA6AbHWg7yqpmWWuW6
	2u6sGRmibq8HyhRuvp+D2HZvc8yKG/S4/rf+GsweYzZu5EHpGFi2g47g2ksKax+XtQuQRkd7++r
	YoA==
X-Gm-Gg: ASbGncsEk0uscFSzZU3bymBQdinu1gwC+AenqpyeFDlzFJTTOLk/rSmJvEJAITd5q9b
	t/MVrcvo2Giw03r1f1NSUV4CZuRuEKVf9W5KoEWtz1T5wzlzVJD2NDk0Ps/11XtwjoMNjVL20Rx
	KmkCnHEWk6L5T08kZgG23pmCVom6oMqofVvokUTd9TKGTHQCmu3uN6cF7/QY8dwhryh9pkcW1jn
	JQbPB1XrDkjVdcEyjct66+xdzBl9yHm6n1D2Fxp8WUzZb/RZsNGGrB8fwtkxumAfO6QVa7t+aP8
	PFLPdw+S/AzSz9mCuoDI3plMY1QabtzH
X-Google-Smtp-Source: AGHT+IFTaGMYHx2rbiuM/J+qzdIFosf4Iui8BHc1BoyzaPqpSEF+S/JgBLcVuEJoVLWmsCq3yTx2mw==
X-Received: by 2002:a05:620a:1a90:b0:7c7:7dba:6ac4 with SMTP id af79cd13be357-7c927fa2866mr800903185a.31.1745032553126;
        Fri, 18 Apr 2025 20:15:53 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e52asm174202185a.17.2025.04.18.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 20:15:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mohammed Javith Akthar M <mohammedjavitham@ami.com>
Subject: Re: [PATCH] arm/classes: add support to configure fvp-bindir
Date: Fri, 18 Apr 2025 23:15:36 -0400
Message-Id: <174503253591.2569909.10433119774099106985.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <PH0PR10MB554502D8256670F2960C0569DEBC2@PH0PR10MB5545.namprd10.prod.outlook.com>
References: <PH0PR10MB554502D8256670F2960C0569DEBC2@PH0PR10MB5545.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 19 Apr 2025 03:15:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6479


On Thu, 17 Apr 2025 09:23:03 +0000, Mohammed Javith Akthar M wrote:
> Currently, fvp-bindir is configured to use the build path. This commit
> allows customization of this path by defining a new variable FVP_BINDIR
> in fvpconf. This change enables the runfvp script to execute without
> BitBake initialization.
> 
> Testing:
> - Tested using OpenBMC FVP build.
> - Defined FVP_BINDIR variable with a custom path in fvp-config.inc and
> observed the changes after the build.
> 
> [...]

Applied, thanks!

[1/1] arm/classes: add support to configure fvp-bindir
      commit: 42390742b10a62658d7cdd941d7f8f26c185c38a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


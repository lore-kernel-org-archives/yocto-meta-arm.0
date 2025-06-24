Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567A5C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 19:32:02 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.5205.1750793520010733659
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 12:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Vc4uxAmz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d20f799fe9so81220885a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Jun 2025 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750793519; x=1751398319; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YTANm993Vzn7KARo8vXNcNYbZv0PvlT18luAosSRYc=;
        b=Vc4uxAmzVyDE5lLCF/8VYXx6RxIku4iCfhI8NFRTlKZBEqIeyMjopNwS4P3c+Nt2uG
         z3KWcrjb++YucQkpDVjXbtujYwK8u7mB5QY5/0h7f7QAkZhsohVsN86iDFGUORxgXUEm
         t1mwwBXxanzYOP/BjMupVa26HBzoDbR+/eGXoGvsN9/4YUmmVrHm5YlMlc5FxeRM4/zk
         MhqtVG+K3xfjROZTpXiHzMQbR3jU2aDZRZXmaGkJE07UqS8kWSRQ+Sk8loZ650fG8Fvj
         0Rkbtd4WgfzC60FELOM8+l6QShuL4nAv6CNVtTz1b4hLaMFnF6+9D7wGKbJgv2+xmp5H
         2P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793519; x=1751398319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YTANm993Vzn7KARo8vXNcNYbZv0PvlT18luAosSRYc=;
        b=jw6JMVWZ0rgC3ByyglmTKHMD8k+TJ9XGwAM8lM4ZXodC7kienAdpVkCr4um8T88nmo
         4y11H+y48rcM/klbfwBiqSABJ1auPHT3bWCQx6jxag2h8eOw2QQFfBo6kh4p1tTxFGfz
         WDdqX7tUnVgsakXgUl5XOnDSAbLdIj77mcB7K71R+RO951wE829nH1KmXNEY+N6IlCTV
         L0FAsJZ4kGwHvShVjokcyVuz6F9piKUpx+HGFkCzs70HfWq/GAgqDjrqkGexoj6k2NHO
         ffwMrDG+EUHmBohFDkL6i4kXX8VroP0lvQQWbfJnoJnSQXIMjdssJb3L0qsyKCrl8ebi
         3N6Q==
X-Gm-Message-State: AOJu0YwP2lcPvR42vlY5mHl2cE+p7MAmakWynTCSDZZ3JdKUT7OST/jI
	fZwP6VlttGML4LLDv4xbksJoGiJeQ+awuun5TrN+rOVvcqzKfxAWcAQjxZVrM0IUdK7WX1gTrK/
	5s/E=
X-Gm-Gg: ASbGnctrqAoL0/bSpBMKLYXxnpCDPZUznyzKGb7TEIT0LWQ+pk/N2s5QNpwjJdINiRr
	BAlKubcMLHkSpP2dKY1tnHoSGP7HD9/K+wKdy5mE3RWPtlJ57+g402So4cRpuY3MR/YQUK8RNR+
	AN5c2O4/qrWTe6FtzxzDF1fREgACnQOS1pHJD0ASIqlfo8AiDYW4dN/hjptdQ2md2buCWcKLylb
	7s6A2C9Rbt4lO1T5dy+ZH+Z6nEY6cFVj16pgVheHCXEwIU+StaI3JYLr5hccTysmhvHwBs96ZvR
	tLhUZQYZh4J0kRMdLLVVfzyTjpHTvUYi2eyYb48SNlWPMt2EfPF1FQ==
X-Google-Smtp-Source: AGHT+IGyM8t8z7GKiiatktocg22ISTaFH1rLd0eLQ3GjeedJtk+TR9RodrRBrRFH0FaGEJqieF1cxg==
X-Received: by 2002:a05:620a:462c:b0:7d2:257e:21d6 with SMTP id af79cd13be357-7d4296359c8mr48333085a.9.1750793518831;
        Tue, 24 Jun 2025 12:31:58 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd094342casm60834546d6.29.2025.06.24.12.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 12:31:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Yogesh Wani <yogesh.wani@arm.com>
Subject: Re: [PATCH v2 0/1] arm/trusted-firmware-m: Remove duplicate config in the cmake file.
Date: Tue, 24 Jun 2025 15:31:41 -0400
Message-Id: <175079350181.41239.882674309285535680.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623110134.3074109-1-yogesh.wani@arm.com>
References: <20250623110134.3074109-1-yogesh.wani@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Jun 2025 19:32:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6583


On Mon, 23 Jun 2025 12:01:33 +0100, Yogesh Wani wrote:
> v2
> 
> Added upsteam submission link.
> 
> v1
> 
> The PS_NUM_ASSET is duplicated in the cmake.config and the config_tfm_target.h file
> under corstone-1000. The commit removes the one from the cmake.config and keeps the
> one in the header file.
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-m: Remove duplicate config in the cmake file.
      commit: d91c6d7148dd879da28d452966d418d7d6cfef89

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


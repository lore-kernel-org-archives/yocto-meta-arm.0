Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1139C9EC95
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 14:29:53 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33841.1768228186994452971
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 06:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RiE7MnOJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2148ca40eso935439985a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 06:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768228186; x=1768832986; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NM9SLldltEsN8pozX6xVfXiS7YPgo2885pk+rNCmBc=;
        b=RiE7MnOJqCXMC3jaJIv5JhFU2cMrDNXyAXI5uzcyLCF35mu/oDoyj2zJGD17eMEBnR
         uDZ9OWsa9m3yAcPE2AItU6VtXgkizUY4OtS8R0MF5y6JZ9l6yjiscLxT5i4skz6jrCa+
         8Wz6KPpwIK/s8FmhZvJfKJ2AiKMQIewzxB1hFDJI3lCgGqyfWpVrTgc14a0oT8Ut99Z/
         sYZFMcRv9iiDtoYuFqTA3qcFxXFV2wbUhrGUnjGA84HI6xe/AJqMJ/YYWEuucJFQS9Xv
         mNSOUX6oi3AV7P4XLPPvwKBDeZtYIZD1C+jasT0FDY4z4jV6VcXB2lyp36TcXsMT34OZ
         3eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228186; x=1768832986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5NM9SLldltEsN8pozX6xVfXiS7YPgo2885pk+rNCmBc=;
        b=JB6XNyGETgyfMc44TirCnD8km0t3ErVXx+9oclyR+jIX3sr1eKRZPcg6c3vi35JbbS
         EHhZUucALVltISQ/Z5RgAquVFC1tMExxZjzDxGSrupvOTyMMh5Z2eixsXQ7vZnEBnl+9
         Zop9WZORdnujEQwaN13VDCnxpdIx9PvdjRpVBjvxdNeXU5OLbjbtU3D1CV/q4dqFL5AI
         cwe+ihxg3lR4cYH4TfWl4Ztwa0hSk88w6CxH5TQ06LSJ9voITT/k/UrG0WmYpMSVSkhj
         kmGuKhFW8Tg48po2/qis0F7x/CnF9jf6MiKVQSKjLzRkfll1Pct+GLn2enR2gcLrYwyI
         MgKA==
X-Gm-Message-State: AOJu0Yyws0hQWwwGAmIdxxLW7rPONN64pi9J2YEM4JfDB+fn2lkWF6OS
	6yPkpAj8XWprfM0tkbQaMtgchBCihkziRTXW15Zr6FXP/YvHXXlftVzzc9uvUzdujaidIgvd5uS
	pml8=
X-Gm-Gg: AY/fxX5KjgWolEB7n6wI8Mwrk667YRcNppUJwh7Oa/eNvB0eJEMygE7Js2a51yiLTpu
	+O7XignohCZboXa33n7T9xJ/jSywGFO9cY2TPRZC8rAfWzUpF1pc8qmeQf9jmnZkK8f+P71z1x4
	wzLeGSWwmcYL6bY/iKblRgphpUdmemwlvYkzsVrMmIq2uYoUFvLz8Y4pawcTPchl6h6JUydK8wG
	nF2x2GRbos0oOT/IHglfrd+6SBDfZ5xCLeQaolCW0/rRljDF9TmmIwBHkLB4kfx9ufO1RITPnaf
	MxlW/nXVH9j190RtIfAdZNvQJskw7cb2mab71nIr6nlPlWPylVRwlp8Kj07lP8gFlQ7/RR9naB9
	MDRtdHYKeKOl0d6f9xgNhO6SL28zwzyyHUkMi/eB3swT9EFz56DBsGtjk5XTOz5qTs8t4R9Ci53
	N+
X-Google-Smtp-Source: AGHT+IEmroKjMHpNYFjH7h77roZNZLXhxTSSj/Z6b8lll2kPR4rK2hvCdZwBUbxc9A9A+pl7sMUPPA==
X-Received: by 2002:a05:620a:4082:b0:8b2:eea5:3311 with SMTP id af79cd13be357-8c389388cd4mr2229338185a.26.1768228185829;
        Mon, 12 Jan 2026 06:29:45 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e217bsm134676206d6.13.2026.01.12.06.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:29:45 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/5] arm/trusted-firmware-m: drop unreferenced patch
Date: Mon, 12 Jan 2026 09:29:34 -0500
Message-Id: <176822817491.4053833.10509648762696315582.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260110165242.38662-1-jon.mason@arm.com>
References: <20260110165242.38662-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 14:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6835


On Sat, 10 Jan 2026 11:52:37 -0500, Jon Mason wrote:
> Forgot to remove this patch in the previous commit.  Removing now.
> 
> 

Applied, thanks!

[1/5] arm/trusted-firmware-m: drop unreferenced patch
      commit: a04d71be6ddf5efd21d7b6196313fa4bb199b49e
[2/5] arm/hafnium: update to 2.14.0
      commit: f9a5b72d886109e4cd8a269271e74c482798fa2c
[3/5] arm/opencsd: update to 1.7.1
      commit: cd37ca98eda3ea8bc4fab59cbddbb089a0315b42
[4/5] arm/machine-summary: remove gn
      commit: 2869dcc84baafeec55bac393097e71fd17bd6493
[5/5] arm/boot-wrapper-aarch64: update to latest commit
      commit: 0911c33ccd261795198d76714f759b37b956374a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


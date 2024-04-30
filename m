Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5523BC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 03:22:31 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.6698.1714447345395420324
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 20:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=zYc4vKSP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78ef9ce897bso361153885a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 20:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714447344; x=1715052144; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SJgCLcNK8wC1fX9tBQiRrjHsg95NXxx+27mHO0M3ns=;
        b=zYc4vKSPNyY0bgBgc0VvSZtZZXB6IGpXCc9SGiptZCsA2UY+Z6Uhr69aRSjSf0X0fj
         Lu4Jpx7PsAltsReym4aJWSlW1IcVu1x6jYB3dE3pHe/ilC+FiaXTnoKHP659UJIrN0CE
         AKKHNruabi3Qbg2MahH3LKS1uWirPgKyGTxP4W1wNLRDW0/8UcTNDb+aakkewl5zkXDb
         +qn+ytYem9/57ecP2xoLkm1NkyaYzZMgp65pDcu3m+wlQZdmP77hh4CjljX4w/ggZsUT
         hunnuH2ZyhFS6rUaR57Fm7yqr/yeTmDfRfbRQ1/KgQZrGUhCKFvxA5SDqu1Awv3NJuVT
         Pqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714447344; x=1715052144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SJgCLcNK8wC1fX9tBQiRrjHsg95NXxx+27mHO0M3ns=;
        b=GjQy0cUY9HoVwg+y8DKueM8kjEeyOjagV+6ekRLf4kwUh9Pj1ra9MfOKma+xc4d12I
         Ufl2TW3KhoDxGsZcCsx0R3oc8kr+AP0PeXk4BsZhzrNT9NkSnz53LnuI8x95bEbxdM+Z
         jYm8fRlOBUtKdw7HjP4DGVXR4sLxiYDRDAUXEDypkv25iJK33HgxqIL9kmXfs7XJ0qdm
         SCNyuvtEgDv9s7mFmak1VxDRcDrHkgRK6Qf+BF2ODO1crG3yJnjY9RxR609hm0k2Y8b+
         PGjBwYfUJm48MzwvivDFBeoW7uupBJBgRAxcs4z+GaOBrtXsH6km6Col0AkVKRaSjAk2
         Lilw==
X-Gm-Message-State: AOJu0YwCqiKtJTUOkDTyY4m1QH574VrlstXNYN9KtkLulpSLcVurY78K
	KPNBeiQwyAgM4AK+tPjaTWV+RAkq4BaqSrUEXf2mxhtk5lhBpkqrw/WototjXEjYSqTjesnQjw4
	=
X-Google-Smtp-Source: AGHT+IFMnZ/pz8pXytU5wvJhgoAfZ35eiAGXVSVcQ+RTR/LJT8v7Na4rAyBtyvX6EjF/WTVtGcyHfg==
X-Received: by 2002:a05:620a:4551:b0:790:7890:5e9e with SMTP id u17-20020a05620a455100b0079078905e9emr1792016qkp.41.1714447344308;
        Mon, 29 Apr 2024 20:22:24 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d15-20020a05620a158f00b00790f882fa89sm1281571qkk.33.2024.04.29.20.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 20:22:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH v2 1/5] CI: add Kas schema comments
Date: Mon, 29 Apr 2024 23:21:08 -0400
Message-Id: <171444726776.3765152.18265000421497284039.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429163859.507226-1-ross.burton@arm.com>
References: <20240429163859.507226-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 03:22:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5637


On Mon, 29 Apr 2024 16:38:55 +0000, Ross Burton wrote:
> Add YAML language server comments so that IDEs know what schema to use
> for the Kas files.
> 
> 

Applied, thanks!

[1/5] CI: add Kas schema comments
      commit: 68fe673cc98b89460d641a9d655feb5f5fc70f9d
[2/5] CI: temporarily backport the procps fix
      commit: fef5eafc0858b790df22b7e4025f8efcde1d84b2
[3/5] external-arm-toolchain: ignore warnings about 32-bit time types
      commit: b6a47cd1803721e2c7eba27117becab58fea6522
[4/5] CI: remove 32-bit time_t workaround
      commit: e89cd1fe41bf1f0b7040145b29fa3590f7479c5a
[5/5] CI: disable ptest in external-gccarm builds
      commit: 9649cdcf7707b809371ae4886de03020d4e8afc4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


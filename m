Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FA9CE8366
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:24:52 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.59478.1727713488440652197
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=qIfe06Wh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.174, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e1f48e7c18so38570997b3.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713487; x=1728318287; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnZVX/dzifi1P8zwOdVSHMUExLkt/w4aLxELNz0jDys=;
        b=qIfe06WhfVvyIf+E+llOoof1xwfcUj5H0+JS/7QE17CryOexOERNQXd/pPlROEmAeY
         jrbgGDtY3HiaBpmVj74zdTRlI0tfsACrsOgSbFazRLIrw3aqmyJkoq3P6AIChKBP1C+n
         lvq4JiYTC+vQ7vSSKudh4iRKoYA0fFZTeUcehagBCSRjIoLyulcnPJcQlsGK6t4p7YA9
         pI7WGZ58Bb6Jb0H/jHaMuzr4MtX6riF0RhJvzW0W9gSFxi6aWWiOpPFaGO0xrnlduIF5
         wIWVrkHLz4hqHuKO95TimPZjN/QrUwpNV8r2wLbF0PXhr0Mf+gIZNphdgtDzuJA6rbqd
         Graw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713487; x=1728318287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnZVX/dzifi1P8zwOdVSHMUExLkt/w4aLxELNz0jDys=;
        b=EJp23wbJOul3oJNQm3w8iWBxIO9sPNA7+R29zrLDEh6ILVakaEt9WXqNetBs/0PjYi
         qz/TsPm2fUH6J9DOSVgMmbNC97uizsgLlGdLPcxBtT4kODzue5TEQ+qn4VBrHLeRLwUe
         W9/YwGsiL49lRLKWwJfakxrNwtZYZ1Gh50FdIaY2aKntSMqT1ZqZo/rP+1vIho8pe9Kw
         ED91b4P5+3rglnkU8X1ORou+Bmd1QKyp7gOyVayOVW7/4XiwbjysC/InIOFbpqh75Iy5
         Wak14fvyNVbg+maFe372klwsjkk+vP3xmkwE2gA2Yv2CzRL77ifoPebU3SHQD8A05L13
         UPog==
X-Gm-Message-State: AOJu0YyDJ8FCdmk3H/YbFw8LdfUsLxHF6Dz3gO5S3x7leq1VAkJh97VP
	RUhIIPNBDDM+q05J0UrymRe6wwPlIllxZ2+3uI0xvSGFoRlNtxjCQIMMADCqwlew+wT2dY5kCWY
	=
X-Google-Smtp-Source: AGHT+IHRIEInfHFfKfHDMTQnPIh9cNaKjSLHAjNLPZmwHBn11GB5nqLoMFGDOf894M90r+s+ppQFhg==
X-Received: by 2002:a05:690c:6604:b0:6e2:993:917c with SMTP id 00721157ae682-6e28b624f69mr12455287b3.2.1727713487264;
        Mon, 30 Sep 2024 09:24:47 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2452f7c32sm14645257b3.5.2024.09.30.09.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:24:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ali.oezaslan@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/optee: corstone1000: Update upstream status
Date: Mon, 30 Sep 2024 12:24:30 -0400
Message-Id: <172771348142.724488.4948070177767998562.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927154916.13427-1-ali.oezaslan@arm.com>
References: <20240927154916.13427-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6140


On Fri, 27 Sep 2024 16:49:15 +0100, ali.oezaslan@arm.com wrote:
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> 
> This MR just changes the upstream status for OP-TEE patch.
> 
> Ali Can Ozaslan (1):
>   arm-bsp/optee: corstone1000: Update upstream status
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/optee: corstone1000: Update upstream status
      commit: 94c54c4f57a53119c07859df7e2bf3c54a0833c8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


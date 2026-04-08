Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205441073CBF
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:59:49 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107134.1775656780178058533
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=Sh2jPM6g;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb3bae8d3eso586073685a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1775656779; x=1776261579; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1MEcefyM38nzSed+FMGCwTzzkA6Khfvyo8ZHSMiM/Q=;
        b=Sh2jPM6g6D6rKZ847ZX4RJYoj4e3+Mngrs610nn72Agsd6LQmilfB2iE8FZVxoc1Ba
         /3DPEJkodBiAyxvBBZFRw5EOJf11WXrWa1KT88nSulQP1j3azsEe+SSfPyav0U6/bhhw
         agMEVYfwI5jB39sN3wpuMO4xePwrCENJnDF1BlSVxdFBsJ8bU8XvK+a6euqe/df+wMYv
         L8nhlOUtiYjWG9qA8PEk1zU2MCSo9BhSaGbGO15j7gcvkXZcN3oxqCw942sIY9uJnPyh
         o9SmGJWvKrFjTipgfpMJs3YpohOv40gPQjn1SK7YS30XYTwWuE3/QImTGVaMe9KnDbN9
         R72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656779; x=1776261579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1MEcefyM38nzSed+FMGCwTzzkA6Khfvyo8ZHSMiM/Q=;
        b=F43KsSn37OkoNP89eToTs1J8PUs88UPF7MmttM3tdg5Ds4m/Vof9w65Y97GX6vFnst
         5ugPPkVf+Ifc3F8Xj/3UkMCiOgRX7es2FhVouo3iwBttEmrel5JB1X2R1F8zYmm9/BkT
         yM0Hjtb5C4efEVSHGQZwIn2H46MYKTZGLXlrQ+qGfhHOs/jqZt2ksEXgotajtEtea1SY
         jlk/942EUb57OdOOk8t2I/5jnZemBKKcIFAXEH9OMgMXT+L72wcQwo2XvS/zNxXA7GyC
         FmDfgEbCDB8B4iomRO3uE5zDjFPDqhF9EcuL0Sy4wsSfKhiEEhtpZgn9nDrYaAYlsAGt
         n+pw==
X-Gm-Message-State: AOJu0Yze5bFQnMRKoWWKTGp+fvWLQSCZ4H30e9/7AMy4vdh5gaAWjM4a
	F/kBdPpsRCpMz6WYSYQkZf3V0dTCZwpNDx7mhNyYmMY6FYof8ewZZKoeVZtuh0+NxC9si3oeYpX
	6/Ac=
X-Gm-Gg: AeBDiesvcOpEV9dNCNped3W/Y6W3nUGrip3526jFP+s3DT0Az167zEco20NJNVr+ohq
	P3lUvxNPCeM3pReVzzzrG/n8UG2gvyF63yorS58e5GWHcx6sCqIJIenSKra/RBm5gQBTwo1tCmY
	pgMf15QHznJOHOgaaArznJdl3JbB1cBABQTIPlZmXH8cuvu5sFPZ7XPjkxka1Mf/bt27qoHzxNo
	fGEf3fu2IrzsitOKfgnABEBGBYcwtsQZW6K5YHsavPB1UaNoDXYArF5woQKj1vVr918N4FLw0Fc
	7+Hk/bX3UerA2xKIxkMpsSEUXFOmo+YsnJf9NQR7FcsA6it8pOe+BDS+8zzwRbKHjGOKT82OmBo
	YTCryMcC0l+Sq1TeZMr3gxj0+sVzBxUTLr30AogJ578+5NgwEKrjE4AcWxYH8BEtQRZlx+a3tMW
	bd/iFCGvi3/U86
X-Received: by 2002:a05:620a:171f:b0:8d0:3c57:8228 with SMTP id af79cd13be357-8d41e5374ebmr2981092585a.58.1775656778740;
        Wed, 08 Apr 2026 06:59:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8647b4esm1561224385a.32.2026.04.08.06.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:59:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/sbsa-ref: workaround CPU topology warning
Date: Wed,  8 Apr 2026 09:59:25 -0400
Message-Id: <177565676545.3315457.14476842698689468165.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406151620.99679-1-jon.mason@arm.com>
References: <20260406151620.99679-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7007


On Mon, 06 Apr 2026 11:16:19 -0400, Jon Mason wrote:
> To workaround the CPU topology issue with edk2-firmware, we can specify
> the number of processors being used, which seems to setup the CPU
> topology mask correctly (and thus no errors).  With this addressed, we
> can use the latest edk2 firmware, which allows us to use the latest TF-A
> version.
> 
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/sbsa-ref: workaround CPU topology warning
      commit: 116c26c80364e3004d00eb48e0236db5f2b0501a
[2/2] arm-bsp/edk2-firmware: remove 202408
      commit: cab9d2db3f5b63c726c9e2b1748745fb9cf3d22d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


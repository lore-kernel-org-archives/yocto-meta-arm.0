Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C0FEDF02D
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:03:21 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37711.1770868991757532934
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 20:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xqoDNsgF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50143fe869fso76978221cf.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1770868991; x=1771473791; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LTsKYmpjA96u9XmcYvs71rjCIewIwNjhZVAfgTPDTs=;
        b=xqoDNsgFY81/C9IW2bkgT6qAw0wcOfEh0GOdDOnV5pPloNdrUVE0p9iWFZcbmovCr3
         75nFmpZJc6QQrB3V+EFy/JikgjGdKJ3xW0H0jRoe8WlLsAi6ekebu0lyy46NzwTrz7BM
         UdI1E0z0ViKWYr3cfXLpqiT79ic/Urwfen7Pa2x/MmSTv7IfjOC8nEr4dzvVYiSADWQI
         93GSgx3VU/mahRUgX2lS/0DVNpLWtK9igAS0ezn1Wem7/wAirXsgntGf30GBo826LhdP
         8U6oIqaaJPlYxE5v7oR+02lBlJK6LwrxMBDZi6qnaMbgHVuzsR4WGV/T/DGkpy/vYOqc
         r3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770868991; x=1771473791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LTsKYmpjA96u9XmcYvs71rjCIewIwNjhZVAfgTPDTs=;
        b=geS52tQj+ZZFdPWS+JR2UK1N9b6lxcm4xIiWWo4774t6VjL4nf+43lMS0RFQ5nTBDU
         ak9DJWBPh/LRr9+BwtVbMypgo3Ai8H/StdfC+Nj46lJGq+cGXG0s7UinRfrHlGiy1QCq
         RkYqDI1UMGlz2aldcacy+oKG/XMia0R8XJxk28mHgxMiZ0wzyv+EFzaUlF3Ptk4B+a6F
         6cTb05YRqoNkJpGBvWhvcS/7PnaYM+0/bGOyTNZ4h1zkl/UeAw3VyIBRAoDOV6whScRX
         Xt3nnxmdAvFyoGerOuW7Vn1wET8rERVjyeiL1nHlksUd3TAnB0B8JH65COpj3UQvzC0O
         aDjg==
X-Gm-Message-State: AOJu0Yww+E9suK3qvuDS87kUYv+G9ueNNFbOB1sjZcPwkDJfXHuq2IEp
	gUwatfiGgEWXQ0s0Yj2d2FLcFGfRVWxHp9rQkfaLXqtKiZDRVG2kYZr/gN0VOJRF+7SuLcmhaFa
	ANr0=
X-Gm-Gg: AZuq6aIFGz1xrQ8J+DS6GIE58uHWv92eozyEes27CFGATEGVbTTCBL0s68lph2gRwQQ
	kgOy1Zi+8InNaHorz1bgYxFtM98jOOrMNhuYE/E+LzW5XjY0XiSvcikSo/yLHBl0FWFi0tJaoYp
	GlNTM4OnoprPM84F0aAeViCogxYk2IL8aPYqnTEdxGwsX2XR5CeillXywMiMYdSMaaqY+3aLoKj
	d1fcI9H6ItWVkdrf34R/wVPYlU6YzXy8W5hr2oNHml9VSHK0W7qTMDgub/FgkB0Ang5JjyVAh7i
	5Pp6RQyBW940hhrjsYZ8cg/JWBcajS3DgD8TCWTan36JaqzkI/QVPUVLeNR5XXxnV0/Llkot7lk
	lTeB+Xbdw9D0xSJomHoaLIfqdj4/CzhkunblsoMM0weLvdIkWfCPXpnUdiEZrTmngUQoZEaRlD3
	TNsCmKZCbsjtLg
X-Received: by 2002:ac8:5d54:0:b0:501:48e9:69e with SMTP id d75a77b69052e-50691c2f38bmr23105571cf.68.1770868990640;
        Wed, 11 Feb 2026 20:03:10 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506847ef59csm27449471cf.10.2026.02.11.20.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 20:03:10 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] lib/fvp: remove FVP buit-in portion of the terminal name
Date: Wed, 11 Feb 2026 23:02:32 -0500
Message-Id: <177086895276.770080.15575684865440601814.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260211121724.1412943-1-ross.burton@arm.com>
References: <20260211121724.1412943-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:03:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6909


On Wed, 11 Feb 2026 12:17:24 +0000, Ross Burton wrote:
> This patch ignores the built-in FVP UART name when setting the terminal
> names on tmux.
> The rationale is that appending FVP UART name takes a lot of space
> making it unusable on complex platforms with many terminals.
> 
> 

Applied, thanks!

[1/1] lib/fvp: remove FVP buit-in portion of the terminal name
      commit: f87babe3f82c8f6a225981b4e5f3cf5091450487

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


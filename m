Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906E3CD1283
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 19:23:00 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.4096.1711740174516480685
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Mar 2024 12:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=CIT78UAJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60a068e26d8so23576107b3.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 Mar 2024 12:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711740173; x=1712344973; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9XzAt+6rMLqvi5WEAkcGmiOJJYm2Ov163KcsGvasUw=;
        b=CIT78UAJxkamveKNiygbmVp2dBYC+300jfH1qiiVRw4VSdZU90gJnHWR+/RNyvef4j
         WFd9/aTcheTNpjsr023VEnR7T+f5MaR/lwSemSSYhyYfa0vUdTJWBNzVePORrRlAgaFk
         mpOS57j9QBGf2fOxshGgldbVN+qm5CTHECOzKxnWLG1xhyAlfNWTCUr309o/v6c5Nshg
         JhbVmkLPSdEXffv+qMO69ybeIDQSsiJRO/9Wm8nLyeouosRwuZ662SW/saVLrIO8IAc9
         CGbggJ8168fwJW9ggcOjjr0OoDQ5WitvdNoMJ7Nnk/rY4xuuN9yS4I0QBpCEwJqg9qEJ
         aAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711740173; x=1712344973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9XzAt+6rMLqvi5WEAkcGmiOJJYm2Ov163KcsGvasUw=;
        b=hsgIjyJCm3JfZRzpfEAsloWvD3Qyklvq8eo0of3klT3+00TOXDGjqZoCVXw165KmKE
         xk1YsyyCDOv7+U6xETP6Fcy3OpsUnzABK/2+3+cOsxp+wZ2ZcqLZHOfrjY1/Clt2kG5n
         byTfie8J6JndvdcpPEGL5C3qwAuPEXFBw/nHB6lG/lDAeRpYwto/nMy8iiv1bkhAkAHU
         GVvUwhw1Q4WvnTEgMPzkru/V0g8YEAxSSDBJDq0R5juB4pRcXyme43TZTtzLauEtmGkd
         WqxgQd9hSIvZAr2dHQ5eJ2OuRdkGiHZyGCWCQY5qfjlhHBua9RLS5OI5MxRq0iWZox0M
         bXWA==
X-Gm-Message-State: AOJu0YxswMlMAzezd/t4u13bQbiDNzHfwWJwbk4CnfQ1R1SQiMRYPar8
	PCOJoorZox3dhznqeYb9zfjGv44i8uPTTzpt0CJrdOpBWWxZzLH0kZe+eZQKcd9OR2M3iDCbe18
	=
X-Google-Smtp-Source: AGHT+IFh9s81V6tgvNsR7ju16xvrhqWCSeXniS2hmuvF660VMV4OyAmlI91h+LaVMJWaHFDt7MykqA==
X-Received: by 2002:a0d:d783:0:b0:60a:16b8:1042 with SMTP id z125-20020a0dd783000000b0060a16b81042mr3217605ywd.16.1711740173530;
        Fri, 29 Mar 2024 12:22:53 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bp43-20020a05620a45ab00b00789e9bbf962sm1554951qkb.133.2024.03.29.12.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 12:22:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ali.oezaslan@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-a: n1sdp: update to 2.10
Date: Fri, 29 Mar 2024 15:22:05 -0400
Message-Id: <171174012660.4098959.4291947636332947644.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240328111841.1960-1-ali.oezaslan@arm.com>
References: <20240328111841.1960-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Mar 2024 19:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5502


On Thu, 28 Mar 2024 11:18:40 +0000, ali.oezaslan@arm.com wrote:
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> 
> This change upgrades the trusted-firmware-m version to 2.10
> for n1sdp.
> 
> Ali Can Ozaslan (1):
>   arm-bsp/trusted-firmware-a: n1sdp: update to 2.10
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: n1sdp: update to 2.10
      commit: b5f2a793ea3be1c90b50c9c9de92a9fb89f525bb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


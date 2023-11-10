Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D043C4167D
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 15:05:36 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.29647.1699628731642737894
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 07:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gpnl681I;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41cd444d9d0so13846861cf.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Nov 2023 07:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699628730; x=1700233530; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPWkFaUMs/08cqdNJwIjnsvbSzekyjvMMte7m3oJL50=;
        b=gpnl681I9XKJdaJ+46+P4wqhLoeQ3YP3Bri/Ad/R23PkDROx3BTfn7ERptfXbaOBou
         u2n1GEQp10Y19cAldsBvUC5s2bp3eBK1j4fFVvyAVF32U0SopzaLAIzZGNiMOJvIw45r
         GP0bpJLuavK37TBuVC5cjsOaKSx0v6OPWm2FmAw+XlnFViL/W0Z1E+gU5VZ2e7wxiISx
         nDh05qmJfhwgUQP2sU/MMtqvxv1x7aSaJyRt077XsjsmdLN/g/Xh6sjexsSEOeyLDs0U
         EvkM4OOCg5/8gEskrZupSKaS0OYDu2TIPD0vtum/bI81eG1NdXu4Rca7AaiAHqiUyeHn
         tBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699628730; x=1700233530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPWkFaUMs/08cqdNJwIjnsvbSzekyjvMMte7m3oJL50=;
        b=nETW9Q/JqEnmavwfpyDxMD7JVAnJrI6yUSMdI/BoaRC/4vBSvXIpCbwIdnopC7tw9H
         a55fJOjrG468N7+qpyv7au5H+mQji+XVJvd55uxuEIoQkysONNmKP52TdGCvZOrWKmPS
         U2m5M5MKS2Yt/I/ts2DyzU0znkrSAxVjBSSKQANYauW3ePQvXd6yWWmrMoGY+oUjPTx/
         sziJ/yVnoh5H/FKR+uxoBICLXEv3xEHc8i1WeCQHe/KrnNOhw6yBeN0nnGF9h5Ac33WV
         C8c7HHWqp8KJaWzOXbAQmYcOP8t3ccsyasNRdOvnIDfrJyfCyg1/6mfGpk9rllYn+t60
         PqDQ==
X-Gm-Message-State: AOJu0YyqBUGKuX/7H0ScaiqKlVnXQACukpZ0/7ruJkXbeg+gbmxXQ/yW
	W1Y/j7CBtddwOboniDN0f0OVZaqxfQ0zV6sKnvE=
X-Google-Smtp-Source: AGHT+IGiR5lr13/0HVq1ZhbtGuWy0zBQ4xHsPsppLpawEfHwQLDs9KVm+WXSMh4k8IvWU+jD8Yz8TA==
X-Received: by 2002:ac8:570a:0:b0:41c:cf9d:aa0 with SMTP id 10-20020ac8570a000000b0041ccf9d0aa0mr8638539qtw.32.1699628730298;
        Fri, 10 Nov 2023 07:05:30 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id fp18-20020a05622a509200b00417fa0cd77esm2848788qtb.80.2023.11.10.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 07:05:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/u-boot: corstone1000: scatter gather list workaround for ondisk capsule update
Date: Fri, 10 Nov 2023 10:03:16 -0500
Message-Id: <169962859922.2631724.8786521911198987101.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231109105803.1577272-1-emekcan.aras@arm.com>
References: <20231109105803.1577272-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Nov 2023 15:05:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5225


On Thu, 09 Nov 2023 10:58:02 +0000, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Corstone1000 capsule update implementation does not support use of
> scatter_gather_list. This workaround passes 1 as scatter_gather_list value
> to pass the NULL checks for scatter_gather_list while
> CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag is set (which is introduced lately to
> align with UEFI specs). Since these flag checks are not implemented in u-boot
> properly and corstone1000 does not support scatter_gather_list during capsule
> update, this patch will skip the check only for on-disk capsule update.
> This will be fixed with new capsule update design.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: scatter gather list workaround for ondisk capsule update
      commit: a703cdf09b64c553a1c0ceb6442fe87873cf651e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


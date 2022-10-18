Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF92AC43217
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:03:26 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.1657.1666054997240393314
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 18:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ddGlZOHF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id de14so8460276qvb.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 18:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfnNF6NOtqHFeXtPZRi2NwOWjoWligekbnhXbkYTzQU=;
        b=ddGlZOHFYOPG+23UO99QFxVO0nUmc+d/ggyyBviZYHPtTPAvi67wc/IWchL4mHZYuY
         1GjVqfr6PcP0YXKi7VdfrM+FWGL9Sy8JWMxYWd4PFkJEEdp87vWwNfJu5TiLXHgfFhAy
         gxjaxVMiOkAbEHUgVGuM79AcNiIcs/NCaHJxjAZZKgt7c94rCRNNLjGdNscyblYAPHJT
         KPmf7toSec9ZMJPdGw/iltlupe5JYKkNc1u/yEEVr3IYSgcxpBCi2iAapcFZE2xrXEcw
         oHLUD446Q6nF3rztHJ/w0cOKfe2pI5fiN3vORkheBkoC5vQRdydIDXKIWfmWoeRpLvcD
         A/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfnNF6NOtqHFeXtPZRi2NwOWjoWligekbnhXbkYTzQU=;
        b=4dLdJQ5BwutobWT8KhR8lphXHsUFVazL7+T8AHOb+1H5/49f0ZULWWNWN2ZTbJjZMb
         5aYdgb/7Tqx29gRt/sC2yFOPRD5JqD70VoUQUsNk4XIorrKPy6wLZLASEfo4RyLhHP8L
         mTQnV5RQGc8kfZ1d+tTp7yxli51tDPMAlt1r/RjzG283MMh0OmBGYw+PtWI5xHfM+WfW
         ax4cg0CLlA7mJtcmndVRp0DE3DNmQi4s1hfmnAAVDkBwkRn7qqAvrY8SnptNBliY+qmQ
         6T75Xz2yoJVLRActJEkeFUE0IRLQSNViA2WuVgdRNpnv7YjbAGcjfSydsjQnF9Hbef00
         rNAw==
X-Gm-Message-State: ACrzQf1YkPXGwRQHkm7XB2L8WrJUNgUcpwWaoyZ6EA5q3rBp1fC0TpoU
	Rb1ATKzzq5c6GLQT0lZ4E2bTfVfg127faQ==
X-Google-Smtp-Source: AMsMyM5lUTEkbOlhhu8jNyUK65gkHUYiBEJaElUYYVqxfMyhVvfKQTDcaw/lJGX/TWlAFfyYw8Hetg==
X-Received: by 2002:a05:6214:27c5:b0:4b1:7b3b:4098 with SMTP id ge5-20020a05621427c500b004b17b3b4098mr291697qvb.27.1666054995860;
        Mon, 17 Oct 2022 18:03:15 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id fd4-20020a05622a4d0400b0039cd508f1d3sm887538qtb.75.2022.10.17.18.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 18:03:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 0/2] arm-bsp/corstone1000: trusted services with openamp as backend
Date: Mon, 17 Oct 2022 21:02:58 -0400
Message-Id: <166605497973.4026862.7646901687766069627.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221017210136.352276-1-rui.silva@linaro.org>
References: <20221017210136.352276-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Oct 2022 01:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3978

On Mon, 17 Oct 2022 22:01:34 +0100, Rui Miguel Silva wrote:
> This series, update the libmetal, openamp support at trusted
> services as Secure Partitions backend for the communication
> between the host (Cortex-A35) and Secure Enclave (Cortex-M0)
> in the corstone1000 platform.
> 
> Cheers,
>    Rui
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/optee: add log handler
      commit: c3ada285de30a8d2ccdf84dd977b89f0cce49c2a
[2/2] arm-bsp/trusted-services: support for libmetal and openamp
      commit: 63cf57290be9e62694c043eb79cc23e1e005f09f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


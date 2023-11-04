Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BF5C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:19:26 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.3647.1699067964376129411
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 20:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=B1uQA8ns;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-66d134a019cso16382756d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 20:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699067962; x=1699672762; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG8VLGYBdv5MAXH8TMo+HYNjaytYePeA7KAPshzlcJk=;
        b=B1uQA8nsNIAE6X1aVJhgCYjwjoI7KULVXxpy+MfMTiU/9qeNKDlagzTUYeuGsrJv/L
         Yw90ZmirHctrnx1Yo15IYRLLuhnOxSu9T8UXQ92DJtQ7hiNyNBnjq9YtGuMQby5vOk+O
         +4RsGxHDyK6To5qawCaYHq5rIGXSlFhDN/RZ5mgSwaOMSYDDWGh/hEvK5qQypyaTlO7e
         7uN14ka/zydCyMReN0KPzoZwTfSgSLr2TBR5tDrrH7+TlkwcujdBWbmioD3KrzoInbZx
         0mchakGAsctVMNBrFaW76tGOdvlIs6Span4cBv8mnjQLuT75pTZ2QCXu5+yNYWa/hekq
         Y8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699067962; x=1699672762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG8VLGYBdv5MAXH8TMo+HYNjaytYePeA7KAPshzlcJk=;
        b=gX+wSQjwRF1hYclJOnu+Jw3evcTUW06H6udu19vZ1oUijnWdUJ39WFFB5iktNt8d/v
         75Ck+96dq3F43jav/8qYliKlaFT4qQKZgnI33jcSKQUcv1RIQPU9e1r/caXYJ25N5Fdk
         AS0MmFnQcskTrpwGtHp/aJACzmsIf5AsdMZsc7vPAo9plNLL7+PMoEv+9iOzVlnrt3e7
         2yWjfTjppsng/8h45Zlju+3FtOviKW08g+iLydPkxzw2Nn+j24FYNcn2RHr9S9/3CyOl
         iM4KViXUNHmHF5Smn/45xHD8trleYJlZ/4tnx7Anb3ryHpYx3bVDlAXxsx/ANLlFf9IQ
         AIBg==
X-Gm-Message-State: AOJu0Ywc1S1hoc8XkGL+1AjH84p3tjCgdDWwTzW0O9fKKr4ZkyzCjwpM
	n1YBSVbRPmTxpBCv7WP1cUGL46He5Dz12IM/x2A=
X-Google-Smtp-Source: AGHT+IEPIPWV0Hebm0v0QxUUN2MpKheYFqAoeaL/br1QRhrDxA+ktzvcn5/yUVDrseSNFOhua9B7gQ==
X-Received: by 2002:a05:6214:21e3:b0:66d:2eb6:f3f6 with SMTP id p3-20020a05621421e300b0066d2eb6f3f6mr23358602qvj.32.1699067962616;
        Fri, 03 Nov 2023 20:19:22 -0700 (PDT)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g9-20020ad45109000000b0066cf2423c79sm1309187qvp.139.2023.11.03.20.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 20:19:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Debbie Martin <Debbie.Martin@arm.com>
Subject: Re: [PATCH 1/5] arm/fvp-base: Update the default testsuites
Date: Fri,  3 Nov 2023 23:19:01 -0400
Message-Id: <169906794307.2452233.13210099213167088355.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231103094939.1290558-1-Debbie.Martin@arm.com>
References: <20231103094939.1290558-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Nov 2023 03:19:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5204


On Fri, 03 Nov 2023 09:49:35 +0000, Debbie Martin wrote:
> For fvp-base, update the DEFAULT_TEST_SUITES to include
> fvp_boot and fvp_devices. This is only the default behaviour;
> individual recipes can override this using the TEST_SUITES
> variable.
> 
> 

Applied, thanks!

[1/5] arm/fvp-base: Update the default testsuites
      commit: f78716db9860f32f27e376917e032412725918eb
[2/5] arm-systemready: Introduce the Arm SystemReady layer
      commit: aebe535aa8c3505b45cfa92bb29edfbc15723e8b
[3/5] arm-bsp/systemready: Bring up the Arm SystemReady IR ACS 2.0 suite on FVP base
      commit: f6dc41140c5072e39ce718121071083f2e4ff777
[4/5] kas: Add kas configuration for Arm SystemReady and fvp-base
      commit: 16d03e507f93e4259593ddb7c812f9ae14249312
[5/5] ci: Add fvpboot to IMAGE_CLASSES
      commit: 00e5691e2fe0a96b44e2f38c48240c998a1a0f1f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


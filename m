Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0455ACD5BB1
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:47:23 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.7553.1695127635224487844
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ojf7z7aq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.50, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57325fcd970so3446471eaf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695127634; x=1695732434; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOxRYwWC5Gtnpv262EEB6NxpFPDCgMWj/YzjwhdRFVU=;
        b=ojf7z7aqPZzd401Bas2h8UDxpByNSH31FpYFApVb9UOeDYDsk0tUIorBDKK4+i9arR
         KW1p4RsXjXhM4zStSgm6uTtZsnfgS6KKEWVnm/rjckioLNZs5shbZKJPt1IOCct3VAHv
         NBvtjcKYqxoTU6garBzy1DPlFCh40hMtF0KT2Topuhty/3LgP0Ng154GF5VmzxRH/iK/
         nFm7Ah2zll/D8RpsTdB17b3V3WnSe5tiIDS86l0jOIOjkwjSJM+CHHSsDZQe8DvSewTr
         f6M0D94dDwOozR3hLBYTB2KneGZfBBxkqCXHkB7Y8bAdTk0Zd2/WQ/pPHBJwcafS5tpl
         MoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127634; x=1695732434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOxRYwWC5Gtnpv262EEB6NxpFPDCgMWj/YzjwhdRFVU=;
        b=BTrsPUUMGTebTuLB0FkJsgiSKfVW7C2GePcCzqXC3skof/AfYPIz89pD5/QxNImxHg
         6Fz1s4CBXx8Udg7BY/+gbX6fyzer7eMHMrATWoqdyB/uMzL5rVXIbEHZGj/NE5kA6q1x
         SPN00zu8XUF+GMH157sJbBKEalm5f6tKYqaS1FWbL2aFzoL/VVXe0TkCB5VfZnH6NHC2
         bV/x5ltKWDbSQVdBcYnM8famytc/e+Q8ciRl2h8AAEic7Z0OEZ8C2xN0YeyLoAP/QeP/
         j6y2iS2WKA1MAqBkapOxa+f3GDC212cRyY0HTxStb0vpPnJb3M2m3CqTPqLrgfplKiVY
         oA9A==
X-Gm-Message-State: AOJu0YwsLviz0OsycUNzvVRapXgTxdnfWku7TqQQRDZCR9LYkF/CGefk
	FqdXfFRfDr4i0ySWXP0FXFR4FP306/Xqd95jakI=
X-Google-Smtp-Source: AGHT+IGYoZq6lw0l/44onkJ14qlORINBCM4WskmGWWbzILVq3iq2mz4Wwr7vJkxtvLppKc7zDu6z4g==
X-Received: by 2002:a05:6870:170a:b0:1bf:11f1:4724 with SMTP id h10-20020a056870170a00b001bf11f14724mr15675169oae.20.1695127633942;
        Tue, 19 Sep 2023 05:47:13 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b29-20020a0cb3dd000000b0064f523836fdsm4345187qvf.123.2023.09.19.05.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:47:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Subject: Re: [PATCH] libts: tee-udev.rules: Change ownership to tee group
Date: Tue, 19 Sep 2023 08:45:33 -0400
Message-Id: <169512753655.938653.3985158250429974486.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918190452.62938-1-javier.tia@linaro.org>
References: <20230918190452.62938-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:47:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5063


On Mon, 18 Sep 2023 21:04:52 +0200, Javier Tia wrote:
> tee and teeclnt are there to avoid running client applications (CAs) and
> tee-supplicant as root.
> 
> - The teeclnt group stands for "TEE client" and is for CAs (CAs need
>   access to /dev/tee[0-9]* but not /dev/teepriv[0-9]*).
> 
> - tee is just for tee-supplicant to open its device /dev/teepriv[0-9]*.
>   No other process is supposed to open that one.
> 
> [...]

Applied, thanks!

[1/1] libts: tee-udev.rules: Change ownership to tee group
      commit: 0221098739b0923c313945af072e1f9017a570b6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


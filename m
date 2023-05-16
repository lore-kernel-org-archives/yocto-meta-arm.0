Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319C1C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 15:00:53 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.24249.1684249250934146786
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 May 2023 08:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=D7n8v2Sn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7575fc62c7aso1119872985a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 May 2023 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684249249; x=1686841249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZaocUOV2TIoiKrkHYsA7d1cNK8XyKfp/Jab1fnXxbI=;
        b=D7n8v2SnWRVY+JlCWJkJB7EmIcCWciXOleCKahDBCG7CufIlcmGApxxwN2lsNZTcGJ
         3tR15/fkLslr6bIp4692PpweMQhibRKetTx6gtF8unAQl1aU4W/1DWTi0UkhT7b38Q2k
         V/y6aXb+wOYKsKnDlOx4nAMDBMaoPhmx8VFvK8ZPJlNJJs7wGXTcVNPTTDuz1ud7hKPc
         tNHg0esA8tJtTI6IVhIWqu52U7slbLe3wF648VVKrj8NBWQf2yvrZAyfNrqVEKcKMMpn
         jQwX2ePuAkhMAn9N9cbTvglGw9uviNttLrVlEMiEN8NU5MB3x4O24I9txb6x4S4UJNVQ
         BoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684249249; x=1686841249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZaocUOV2TIoiKrkHYsA7d1cNK8XyKfp/Jab1fnXxbI=;
        b=MGxznKBvVZM72yObDkbzg+Z6qK7FboI7/Q637BbzpLdQlrLKyny93Dqj2C6F+2HfcS
         KtdlDYkVJ/dwcQoBsJiy/dQUE4gOw91hgUpfyfmx9zDoyJSpSbWr7gTooF+Z4mUs9C2u
         /h/44wwYwvvifQk1KqXhWCoNM6RcL8aupZnGyOybvYVTkpYRB59HDFHd4SdNgOo5+tyK
         2nEK+Mbd7+LXSTJS2jwEFm5SZnZkDuqhRJwtRnSAlj3ZAF4R2dSp8R3JnLxMDxuVtlSC
         JUpHWoBpLVRi2TACNLO3RcoK0b/VPMrqN+J6YCS0FGRarlpqZ8OXKHhhHqh4xD6vKcDr
         nDQg==
X-Gm-Message-State: AC+VfDw1Z29NLJcDkXtqY7VDtjW0ueBVQ2VgBqU+g3k0T0nwJNHiBwwP
	yQfJoXJgVbt3o/PlkKcVuCVG1+jHC+bKrBpTr9SOBg==
X-Google-Smtp-Source: ACHHUZ54a/WS10Z2NepQNmQ+JA66deBSsBmV9iTxf1MZSBi/SHOL+ZERwd5Z26ggrt0LaUUPmP8l7g==
X-Received: by 2002:ac8:594f:0:b0:3f1:e57a:de9d with SMTP id 15-20020ac8594f000000b003f1e57ade9dmr62354473qtz.0.1684249249581;
        Tue, 16 May 2023 08:00:49 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r9-20020ac83b49000000b003e394714c07sm6263943qtf.10.2023.05.16.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 08:00:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH mickledore 0/2] arm-bsp: corstone1000: Fix Capsule Update
Date: Tue, 16 May 2023 10:57:18 -0400
Message-Id: <168424903784.2134644.2935007048585571377.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515160230.54917-1-emekcan.aras@arm.com>
References: <20230515160230.54917-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 May 2023 15:00:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4655

On Mon, 15 May 2023 17:02:28 +0100, emekcan.aras@arm.com wrote:
> Fixes issues on capsule update feature for corstone1000 platform after GPT and
> BL1 changes.
> 
> Emekcan Aras (2):
>   arm-bsp/trusted-firmware-m: Align Capsule Update with GPT changes
>   arm-bsp/wic: corstone1000: Fix and limit the partition size for
>     corstone1000
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-m: Align Capsule Update with GPT changes
      commit: 75eb154a611bffa56b84b2e4f5532b45c6124206
[2/2] arm-bsp/wic: corstone1000: Fix and limit the partition size for corstone1000
      commit: f9d80e1a14704730323c868a57e60e5664103735

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


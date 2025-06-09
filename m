Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC81CC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:21:36 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.60484.1749478889691696129
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 07:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Hnf9tGZo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fafaa60889so29477666d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Jun 2025 07:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749478888; x=1750083688; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPguuEkFExCIK8usLhEn3W0A5VpS2Ijt1uxXhOgwRig=;
        b=Hnf9tGZobYHwfTlBLz1oUICmOmAD2JHjaiWY81Ajd5hPDZ64oQX990ay1PK5c/UPcM
         YZymBbnnk2paM4MfBfftkH3ixvBt3nCEX1Jh0B4XCnnplTuZSgYE+SZi0uuuIk/z+RCH
         M+kiWhv1h+Yz2dKEvG+uhtgQZ0FclWiD9HQBGI+NBW9BvRrIGBcpWV9iYmi58vYEhxjK
         wmlFd1XKfSFGCBYyELRas16HhQrHjnjTg2YtcYKx7i1msjU9LURP4OJk+bEvAeUzXQSd
         aTIEkCcLxePCjHWvobSVQLgYllALlhAK3DmKGCPHUEItplgK8aKm6riNspNVQTkdeLQ/
         9YiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478888; x=1750083688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPguuEkFExCIK8usLhEn3W0A5VpS2Ijt1uxXhOgwRig=;
        b=eHOYqP5N0njfem7lo8O1PwsJwIfJRlYBB/iEHeDPUpYX31+8GxYiU67gPK1PROUNtj
         83dFjYRp0OiGad/a9bkV8Si4+PN2UjmMoz8ZcY/ixyNsbcvqvJQWEBL6JuLDYq2YGUhM
         q7+elcPk4J2TOCJTDFqGyqtrUhMateg1r4v+2GpTjUGF2S9fgQmAleWuGaf8N2QL7cNt
         B4CuGQWXc4wm890ZpfPFmK7RnWAx13JPSJt6YtnSGlM1uFWf/HZrNgKRX2THwYgmA/jF
         NzVViF69wHbmbbRE2f89VHBENJK3AyQTTic/+PLPI8UztEn23AjFWuajzyVsiw4Dlx1b
         RScQ==
X-Gm-Message-State: AOJu0YwGaGbSwAdZwAgzRR2F8fFgBBf0jGIj797nW/AEyufkHG0cGaDl
	trOxymimMQ04apSbGeLRPaTYdcCjzE3EYZfLsJg4m4sEmCHUNRK3lMbgNXFsKi/Hni1oq4UNE26
	8aR97Xg==
X-Gm-Gg: ASbGncs7BxIWJkVgXNrlbKpiSBzSdHsfI78Hj3N1qWHkJtolYpjtbPYEfYIJ6cndfdM
	mv8713rv1OBN1X+mXMESHbz1ndR+dRjOyj5RT/746B/h/eIVY574ln1mc2WvlajfLLIDouOa02W
	3iIWvrvBR/de81TXpSR0QKO6R2sR9cYH0nLpskqQ0w1O2cwqXPmranUGy9mtlqRN//dNSWPtcHN
	Ki49zh3D644V3o+Jni0ExZ5cldbSHKYZTssDGbhKRyPx2hn47HBaykmCq2juGMn1nlazJKdEWCm
	5OYfsVijvCVtUb69pGwWCWMLedhLQ4JP51zo7FcLxls=
X-Google-Smtp-Source: AGHT+IFhkuTmWkPJlWRMt5aHzW0VAcgeVbMQMZlFW6FLGGcQ9bvjQ5rWA9iUnQWbkwOfDnK/7W1z1A==
X-Received: by 2002:ad4:5cea:0:b0:6fa:cd35:3d98 with SMTP id 6a1803df08f44-6fb08f980fdmr232742196d6.38.1749478888427;
        Mon, 09 Jun 2025 07:21:28 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b1ce43sm52398416d6.76.2025.06.09.07.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:21:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Clement Faure <clement.faure@arm.com>
Subject: Re: [meta-arm] [PATCH 0/3] corstone1000: upgrade TF-A 2.12.1
Date: Mon,  9 Jun 2025 10:21:21 -0400
Message-Id: <174947888132.935305.2231002789109556646.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250605133108.35177-1-clement.faure@arm.com>
References: <20250605133108.35177-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jun 2025 14:21:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6537


On Thu, 05 Jun 2025 15:31:05 +0200, Clement Faure wrote:
> Upgrade Corstone-1000 to TF-A 2.12.1
> Remove TF-A 2.11.0 recipes
> 
> Clement Faure (3):
>   arm/tf-a-tests: fix header guard compilation warning
>   arm-bsp/trusted-firmware-a: corstone1000: Upgrade TF-A to 2.12.1
>   arm-bsp/trusted-firmware-a: corstone1000: remove TF-A 2.11.0 recipe
> 
> [...]

Applied, thanks!

[1/3] arm/tf-a-tests: fix header guard compilation warning
      commit: 6478eca548573cd32675791de728245e6d8deeed
[2/3] arm-bsp/trusted-firmware-a: corstone1000: Upgrade TF-A to 2.12.1
      commit: da4ea26f60813cfb814164781c4186306c8bd445
[3/3] arm-bsp/trusted-firmware-a: corstone1000: remove TF-A 2.11.0 recipe
      commit: ee74646ce8ce44e309fe08958dc9cec1b372d2d6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


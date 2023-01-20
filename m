Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FDEC46467
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 02:01:45 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.64803.1674180098300712536
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 18:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Zy+stgOm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id z9so3163908qtv.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Jan 2023 18:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7b0YeyrEKc4xKzgiVlSgQ4Dc1zxrJWUSC5Sgi3RUNKk=;
        b=Zy+stgOmAIVDED0/guVZtLTQCufEm7Il1j3jj7djABqxFzDk544ivzNA5FbaXjBjOp
         FnK4svasXH0ThiWfWLbOSGdEiSOx5SGfbbnJqflGEun8XYHw3ZwCMf0VL3dVLheQwbsJ
         gZVHIxpF+cD02pOiIOdnrclhTmnIUktiafuC27aZLFt3+2C8uIWISLq4m49X4lZwvqnE
         xj6kHSeA2/7EktB9/N0UZvn4RDeIic3Tt9bOFGhvOPwdM4Ppfpy7qWj9dri8JpahNUkh
         G6PNEc7V4yuBsAz9G4j/8VAAsX/sNJiRGCsfA0IuHz49bIinig+k13LZl7TnV/YcsuIa
         9O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b0YeyrEKc4xKzgiVlSgQ4Dc1zxrJWUSC5Sgi3RUNKk=;
        b=JAv2rt6QDXPBBLqqvO+bOKyuXcRZStwHhLqZJD3P58mMpMhAhPHKd4HcR7/PCZrbmF
         Tl6GW/UCWS8VidzuPacF2YDKgxrieehoDRH3/YEbUFHJ97hKnjfiAS5IydtZ2bGJXLvn
         fRBRfcSm/t706PjrYqsRphtb0CKEnQMV3OlFT02yywjxHQYG5BOWOMnpt1lwZCKTGB2D
         Y5WGHuPQ3FksyIR7NmSbzFIR/9QXWfbPef2auqpLMAUqe0cl6FXIy6F/3TtUxa/G9gL6
         dOVRcLJ5LG2aI1DCk6Z+XjTQjrt2rxJNXR9kY9QGKfS+zJ1JiV9PFvuQYhyYWjJfS3ji
         DZiw==
X-Gm-Message-State: AFqh2kpqE9w40hkI9oHJPGn3WlXgG+6vvfPOsE9tinwEeYOS3YhZo41d
	PXI4dasib2I49tinSfdabQotcTJoncHEEut2
X-Google-Smtp-Source: AMrXdXuoIF1fjbAMOXAOj6pQwoxOydXy6VnohuruPwO8txF7KLLo69Ik/MLt8Puz/AnrYhH52j//xA==
X-Received: by 2002:ac8:7341:0:b0:3b6:334b:2cb7 with SMTP id q1-20020ac87341000000b003b6334b2cb7mr19644698qtp.19.1674180096984;
        Thu, 19 Jan 2023 18:01:36 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id z26-20020ac8711a000000b003b62dcbedb8sm7402604qto.74.2023.01.19.18.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:01:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH] arm-bsp/u-boot: corstone500: bump to 2022.10
Date: Thu, 19 Jan 2023 21:01:23 -0500
Message-Id: <167418008361.2034362.8305720608561860195.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128121841.3949151-1-rui.silva@linaro.org>
References: <20221128121841.3949151-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 02:01:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4304

On Mon, 28 Nov 2022 12:18:41 +0000, Rui Miguel Silva wrote:
> Rebase corstone500 u-boot patches to 2022.10 version.

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone500: bump to 2022.10
      commit: 3f35573acbdc0a3aac9e81d794e14f849d40ee9e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


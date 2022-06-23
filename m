Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E768FC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 17:15:26 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.483.1656004517935737298
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=zXw2ywyz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id c137so2982147qkg.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gDaMnusHB5XirpFukHPrOotXeudfIEdrJrd4hCzEM4M=;
        b=zXw2ywyzTLgOROTJthNqCaxvYN/rOf6ieRo7XpXuyGhlRgg5cU3F9HfZVLQv6TNyG4
         j8pnJij4FNH1xNTiwiBxf/fe9FTdAqsXxvIU6fq7OWRku3vrJFOxOPkrEaLenFZMIRKw
         xG9bMAJxe2y3g1rXYdBhRzdlsGlqM77rwqD0a7rgnkbnI+O+7yKvMe7sXQLpB/JOaYcD
         hQKUVXSEeHKNGrx/z2xM1bc9TNco9xHe9MrKAWyX0Ex7gHZqwDBDmPYLikie2rIsZjmB
         wX3qNzCPKxmltDfBzx1Y1bYrU/11U8cDrTVqWwzl+p3ya7duj3Uq5ZBKda9InsmZv2iY
         q+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDaMnusHB5XirpFukHPrOotXeudfIEdrJrd4hCzEM4M=;
        b=3RxeTB/W4/VwCka5ZZsJfonCwJ9iyPVWwVxgQhI/HgS75lfsW8ZuhpEvGfeFtALfnD
         iB4og+fenE0vcnvCqzMRwZncYTlgik1n3mp8Vl/PEB1KsmZyuCH2XnxptuXoFaR9pIn9
         cWVo0chbQy4ncjBhUWsFNTTD5XwJNEEyxFWF2nYZonZ/deMRLJnnN8zRfoqDH0Uip2Eo
         p8Sro9FBem/v9S1FdyU06vHbJ6m3dk+feKaVSPQyACmbcPled33EF0eAZsu+2CTB2YW+
         t2wHYfuBnhbvqmxtr5b9aPzrgvCeTIhLq/LHUpMND8kt3xU4WDRhLbgXt5m36pBH0s09
         f10Q==
X-Gm-Message-State: AJIora/7vivfCMI7m3DAl/DKUSqg5dnR2zzz8Jm2NJN+9brtAf+CK23F
	j/1AruZl3VxGbRbCS7HOIufciWhiOVGZ5w==
X-Google-Smtp-Source: 
 AGRyM1v+Wd/AhV57U0UEF3FAXRKcoyoEQJqAJIb450j9XMpwWO/vFLPghTG0C0/AamCU7PtTuHASRg==
X-Received: by 2002:a37:68c:0:b0:6ae:fcd7:b9cb with SMTP id
 134-20020a37068c000000b006aefcd7b9cbmr1625131qkg.571.1656004516458;
        Thu, 23 Jun 2022 10:15:16 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 z20-20020ac875d4000000b00315b5b86d0bsm3455496qtq.84.2022.06.23.10.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:15:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] ci: work around zephyr test issues
Date: Thu, 23 Jun 2022 13:14:52 -0400
Message-Id: <165600449335.3410853.3466673427947147967.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220620150246.3171-1-jon.mason@arm.com>
References: <20220620150246.3171-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3535

On Mon, 20 Jun 2022 11:02:46 -0400, Jon Mason wrote:
> zephyr uses icount to improve test accuracy on virtual hardware.  Do
> the same here for the same reason for the platforms that actually test.
> Also, the common test now appears to work for microbit-v1 and poll doe
> snot work for qemu-cortex-m3

Applied, thanks!

[1/1] ci: work around zephyr test issues
      commit: af928569b421431347c84f5941cee7aaa9f0ac74

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7A5ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 12:57:45 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.70109.1661777855661752292
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=2LPoA3qK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id y15so2874627qvn.2
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=xr9J4B0/y9AOZr/JYviztluT3b5nnxt0ndwDe57pINY=;
        b=2LPoA3qKRne4kyDa0A8bCmz+N4UUnIR+sBqL8ADhKo6EdWpeY1dgn1oN1FyB3/FIia
         YoH5a2PzXbnfjM1DJsFLpMWWzO2FyaOC0hHBlfGmQEjK9QZE1tVredK0vaiORJh+CGUp
         QXYmvy99+6Fk8aHiX8rh8ZmXvru3FVYvxR7jJtGdv8xmi9v7VqEkhloLkvnOXU8EwJWJ
         18dFiZBlLEdTgKnX63/TdI+/X/zMfjIyQeCVNnI4te4DGYS0l2pY6WlrrQwXzJe+R7q1
         90ocyglCCrzMc7iH5KRRbp3tsJ1bE/u+4R4fqy7CQp1BRd2cP2PsAB0xlP/sqOxLV8Jc
         XYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=xr9J4B0/y9AOZr/JYviztluT3b5nnxt0ndwDe57pINY=;
        b=0dRqLqSfI8mdfKMxnNFNgwTLEnqXyYhtYzYSD1ebFO3DRWeY0qL1kj4OvyArCBNrAp
         wFBIDuZA0qfeCOJYkP7tnfW6npaxZu5IfUSGcQV7nUVt6r3GiriY672lppzlKZXdSJHE
         QuOJddRXPzQrniinxUt7I/1ZnlsJSTt2k+b4jnhVkkiFjJypdZs3WSLuef2CLvy3yd9/
         L/TLjFzu9OJmrIENGiAws4N6aSQFEMmXFQLIvRt6b+OEcG7iacQrzRKCfiEGwvzPOZR/
         67dIBRrU4SPrERGGH8tXrJuDRXiDE1vhzlnyEO0R3JCQ1sN3ewMyD/qWkx8UfTAj+zNR
         0P4A==
X-Gm-Message-State: ACgBeo1GqlRTzfZpLtPgzLE1GyzLWFoIvMKq/xfAPuRoII8tEF6+TBIJ
	FeVOEFVCKW3G9LrMQVRoSJA3+S+eaV8o/c/L
X-Google-Smtp-Source: 
 AA6agR44wG83fSrhrfGFaKPpDIA2RGKbdFWW2U8kcjsjFuJKmYGCCbpRHho3iPTlraQY8I1Kb3fI7Q==
X-Received: by 2002:a05:6214:5005:b0:472:e6b0:1fb2 with SMTP id
 jo5-20020a056214500500b00472e6b01fb2mr10163450qvb.124.1661777854287;
        Mon, 29 Aug 2022 05:57:34 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 l17-20020a37f911000000b006b629f86244sm5765676qkj.50.2022.08.29.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 05:57:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] arm/optee-os: backport linker warning patches
Date: Mon, 29 Aug 2022 08:56:17 -0400
Message-Id: <166177777779.3919442.13703957118330956986.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826095008.783707-1-Anton.Antonov@arm.com>
References: <20220826095008.783707-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 12:57:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3718

On Fri, 26 Aug 2022 10:50:08 +0100, Anton Antonov wrote:
> When building for arm32 with GNU binutils 2.39, the linker outputs
> warnings when generating some TEE core binaries.
> 
>  arm-poky-linux-gnueabi-ld.bfd: warning: atomic_a32.o: missing .note.GNU-stack section implies executable stack
>  arm-poky-linux-gnueabi-ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> NOTE: recipe optee-os-tadevkit-3.18.0-r0: task do_compile: Failed
> 
> [...]

Applied, thanks!

[1/1] arm/optee-os: backport linker warning patches
      commit: 38daf1ff8c7c0209d3392484d191bdd2f4c81514

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


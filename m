Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3CFC25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 01:35:38 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.11716.1660527331454130838
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PESEejnw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id d1so4564590qvs.0
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=whiEC7LV/Of+reGHjqjyAwCzegnNNAlNdU0t1BnNzU0=;
        b=PESEejnwqOM25fwAfPPg++g53QXvLf6c5LqO0zs5W+ql9l6K4Fhu74i1dmbKuvlBh4
         j2/NbkMLlBa3hfipYJCcsHCm7Jl6CGYNMV8NCA/oHpoZG0vMAp+m8JMZ430SIdl+Yfij
         Sbj61yYI7DOnC3u+fcaj0Fj66zhvN7oVc6swb3OcIEVZMIrxCAacm5McAlvCqATy1/Ap
         0dQq2GrC3ICU5Vr0lfQ3kV4wfrMVTtuo54sPYPZcTANOaE9yO3i0zp1pZfVukLR68YL8
         cjbWUq/NZCNGTy4mba+oKMPNnQ40g7+Np/rx7825M2WEHIGyEZo+BugXYX3DZxjaKXY/
         H+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=whiEC7LV/Of+reGHjqjyAwCzegnNNAlNdU0t1BnNzU0=;
        b=aH5e90D1vnh/YpyfsW10zT1T1AGDTOHyB72bhLs4H2DkOfWR0MaYEgkYWpjdL+nuMM
         3GOL0f+lEKK4ETLaaV+6LCXfOefjGpbdBC8zH5eZzWIeM5rQIzFHhsUaBUvPgo0QtV//
         6GoOeMuc7aMC067dA2kCOWxWMdRvlJMgiRMJbpgpe9vWSAtuCMD4PIgv7R5l8/pC24zU
         IqZJOr+K5r2kdMKSLwqvJE7YlGY4eZBtHkM9CDNEC7VFsNh/ZTOVMQ53R2WarMSvz6Oj
         sHVqO+uTtd/j1UT+Jlbk/f56PFYpp749/QCLqDP5HohFwwYRY3sIgHVIPA1QxcYyA6WX
         QaHQ==
X-Gm-Message-State: ACgBeo1mxlaV4F43VzV44kTiHOlYF8LP/MqbW4X2oQnYb+HCTCu4RA03
	1vAeIW2ydh2It/8G78hQ7PbWJAgnBqcQcG7e
X-Google-Smtp-Source: 
 AA6agR7b7TTcd96TRYAUE6OmHGIZnsyk3PkNJGoHzKTzPuI1EZ2BS/ibkzEDdi7x3EVjIDaMiJvwsQ==
X-Received: by 2002:a05:6214:c4c:b0:476:b7c5:fbe5 with SMTP id
 r12-20020a0562140c4c00b00476b7c5fbe5mr11924047qvj.72.1660527329938;
        Sun, 14 Aug 2022 18:35:29 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 t30-20020a37ea1e000000b006b953a7929csm7789302qkj.73.2022.08.14.18.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 18:35:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/fvp-base-arm32: Update kernel patch for v5.19
Date: Sun, 14 Aug 2022 21:35:16 -0400
Message-Id: <166052731728.2952774.12691706896038362427.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811134236.3502-1-jon.mason@arm.com>
References: <20220811134236.3502-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 01:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3682

On Thu, 11 Aug 2022 09:42:34 -0400, Jon Mason wrote:
> In newer kernels, vexpress has been rolled under the versatile umbrella.
> Update the patch to refer to the new location

Applied, thanks!

[1/3] arm-bsp/fvp-base-arm32: Update kernel patch for v5.19
      commit: 7617120602755051ce45c6837cd8f26fb3254ef0
[2/3] arm/qemuarm64-secureboot: remove tfa memory patch
      commit: 2a92d6294d349303969b12698a151689d69fb0b6
[3/3] arm/linux-yocto: remove optee num pages kernel config variable
      commit: 769a09da7c6566db942138baae177bc95a1faa94

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


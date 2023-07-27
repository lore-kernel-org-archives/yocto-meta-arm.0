Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF68C001DE
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 03:30:57 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.54.1690428646922914846
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 20:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=ixobDcx8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-63cef62a944so3943956d6.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jul 2023 20:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1690428645; x=1691033445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjUYu0xx/7ZoZnZkN4ehJ3NEQ47z44+zuvdmU9Zw1As=;
        b=ixobDcx82cSW9SVljQEX19g1wZb7y30ZIVto3otwfU8AVfgHHKmtAvn02B40lFN/Ha
         y8D4ZL7wtuwg2TOxSAnKuB4/J/eZ5wfk2EAssnu+L03Fl/Tph/vgDLMSsZguIOE5HCqN
         JAffePMTsdcuir2DlyLKgdNm739vGxe5z+XUuOKEDXg7695/igf9zU5IW8DWkV1RRJ+I
         oeatU5r1ph0d5oXCT+lOah8/kpGu2sjKOfiVwHYoz0JnFPCCmakN+1EUzi/YKJvlHBEr
         kwGYVcMYxrBoNi8oCK8KrMQ7YcSAOlg/x1/U4KgHAis4Tn1gzTwZUEfDcEil8Ix4/Nxv
         C6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690428645; x=1691033445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjUYu0xx/7ZoZnZkN4ehJ3NEQ47z44+zuvdmU9Zw1As=;
        b=cG3+jXYi8NmwX0wp+Tmgfg/in9Or8gyE4Q3zuIqO+UXzWhlKbd4OmeCWs3GkYQ+HmI
         oMc8051bcGbHUAJZBa/EYjcN2jM++PgblhzDUzNtbrVH/1kMd6mRQ9JNazxMEx9CcfbA
         V3ZX29dAN398trZyVHXOHkQHng88/bj8X9nr20l98mrDfulPWj6dfU+hgFuldC6DvvKB
         GxSBv50pA7wDMnwsn9QT7IkBtYlwJzSIIIWYy+04+00o66acKbqP+94LWcDjhMr0cxot
         cC2KfmhnJJFSbhFDX17yK0kSlhflOfY7VfTsWP3q/0qTIyEbBJa06OMU8fovfS1//MPi
         ZBOQ==
X-Gm-Message-State: ABy/qLb0oWx7l+RR+fV+4HKB0LAA18UoQYoFKAOSnCOwfZ12yqCTbQMH
	2VMeXGtzl0dttLSUNJzzahpdgI6DIS1cyGi2UHg=
X-Google-Smtp-Source: APBJJlH4SetllcLcGO4uQOn9nO6sSjYpykIbGRNv14CF0uUeCN2JdzRsB6JxAi9yZgPvef4iDSyOPA==
X-Received: by 2002:a0c:dd0b:0:b0:626:2e65:cb2b with SMTP id u11-20020a0cdd0b000000b006262e65cb2bmr3368085qvk.4.1690428645516;
        Wed, 26 Jul 2023 20:30:45 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i18-20020a0cf392000000b006166d870243sm129697qvk.43.2023.07.26.20.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 20:30:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	adam.johnston@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-a: Reserve OP-TEE memory from NWd on N1SDP
Date: Wed, 26 Jul 2023 23:29:13 -0400
Message-Id: <169042855629.3962951.10854273531700490599.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230726151725.1231013-1-adam.johnston@arm.com>
References: <20230726151725.1231013-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jul 2023 03:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4924


On Wed, 26 Jul 2023 16:17:24 +0100, adam.johnston@arm.com wrote:
> From: Adam Johnston <adam.johnston@arm.com>
> 
> The physical memory which is used to run OP-TEE on the N1SDP is known
> to the secure world via TOS_FW_CONFIG, but it may not be known to the
> normal world.
> 
> As a precaution, explicitly reserve this memory via NT_FW_CONFIG to
> prevent the normal world from using it. This is not required on most
> platforms as the Trusted OS is run from secure RAM.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: Reserve OP-TEE memory from NWd on N1SDP
      commit: 308e5d7145f2a1295283db445970dd181ecd67b3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


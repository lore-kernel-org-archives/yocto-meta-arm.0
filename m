Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55BEC83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 22:29:51 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.4041.1693434587665471157
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 15:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Fs2Jz6A0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.44, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1bba7717d3bso70670fac.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 15:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1693434586; x=1694039386; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQrXA5kX7lg2KCt7oxDfL3khpWt9IGCC6usu7S4Z8p8=;
        b=Fs2Jz6A0IvTHBJUcXFoc0T+hNjPalU2PN9Rr1eDHHruZPLAJ9A6qUspFKMW5sTZ9Pn
         MM4b/+30YADheL773y6eW+DzSt6sTYzFVkY3B7ENVxBzjrWYm0KsSePfDvotK0il4qWR
         LhasvSztAv8HbfoOgsa8jjmjPOVDhQxbBU8BZrCk24IIcDmxWhk+f5eJQjxOVvCEgBY5
         q01jDYD8fN+0YP2lSEyyWu0oF7Sq1lVezEJIaO9rN2H9I3Rk+omlKf13ddXWCNeaLf7B
         1l8LPa/NGGq7+axIRBgqYgNIvfrgWRUS0IhrSCrPi2f3f73YjBBavCTSJBWqoHCOl3Cf
         IGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693434586; x=1694039386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQrXA5kX7lg2KCt7oxDfL3khpWt9IGCC6usu7S4Z8p8=;
        b=fMskeCGwKy+5Nb08rnN8lIBF7zQkCZss76x3l8rOgZDnU5ONdfXYGH6v99xI1luAEO
         6IM+W5YPZ800EcO9prckV13ix7+sz2xxQfMcQSdnc5m0gDUkeziIhxW8ZHkV0f1hWplW
         mjp1RktPXcZpa1solS/Qa7dU2XJKgGMKvjUHH08EgbmIuGcaz7qI/Uxx78Ie9f1gsroe
         HqU05cihxxfta/CzgGVk+6L7HRLrJpbg+JzD4riOhkezs8MFbhfI3LwS7H5NA6cWFe2z
         mIolD9rXnPRgXDDlZfZluAiXOakj8qQT7DyHS83duoJUWvCYo+jjKiKdUWbGgicHwavo
         LAUg==
X-Gm-Message-State: AOJu0YyRhjCKdy4HmtzkRXU47VGv3+NUme2liNbV3ZJnlbX/VI6TLnmD
	DHo5rB+q09SwjV1//oRNDqSSDAwkFMJdSrTn8Xc=
X-Google-Smtp-Source: AGHT+IHZRDH2IK8QHNjQfBlJ6VkbQF3mWVsoxOk9FY/oqiN+oAhmJZPRHhjKq/H6x0s+tStmaqdBGQ==
X-Received: by 2002:a05:6870:a2d0:b0:1b7:670e:ad85 with SMTP id w16-20020a056870a2d000b001b7670ead85mr4044288oak.49.1693434586450;
        Wed, 30 Aug 2023 15:29:46 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p9-20020a0c9a09000000b0064f4d8e573fsm22611qvd.36.2023.08.30.15.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 15:29:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone500: upgrade u-boot to the latest
Date: Wed, 30 Aug 2023 18:29:11 -0400
Message-Id: <169343455400.120020.16933541717868999629.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230830135710.3693738-1-jon.mason@arm.com>
References: <20230830135710.3693738-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 22:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5009


On Wed, 30 Aug 2023 08:57:10 -0500, Jon Mason wrote:
> Rebase the corstone500 u-boot patches to 2023.07.02.  Some defined
> variables changed names, and had to be updated.
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone500: upgrade u-boot to the latest
      commit: bddec6c8007a43e4b08333aff8de19eb348d51e4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


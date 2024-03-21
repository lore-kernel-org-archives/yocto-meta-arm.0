Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6274C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 03:47:45 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.214.1710992856687255631
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 20:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=rOLv7r8g;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-690c1747c3cso4742846d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 20:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710992855; x=1711597655; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YM97drc+mdmKK3MIBEM7YbCMasSOHnBNjJH4Pnwn8Xw=;
        b=rOLv7r8gcZyZgSbRr48AwFVBr83PCIRg4FkzJRwhljDz1bcZ6J39XXIHKQOPc3h3Ty
         7dn2sKYV2EFcFwEoBnRJlDCplMVXoXzQZfozzxNQ0qDEK/ywJiaHLch8iVsciAnFgxRi
         BhpE/cm+H3Q031ZJtvI9soxJQprrpcwjH2dCBAbaCC7rIe5rV2UsjVtLznis8c7fFGBH
         DWQoiV4EXy+8dPaj+JCq2ITtpewSWIIcmjqf997+7PM/j2ED5mocBA0Uhn1za/rSQyK7
         DwEvGhGFdvsFZfjcjvqFDMGHUfgcdGfTJJQFQgmiOdsdilu3gs1XLEolcczhZCksW0Oe
         fHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710992855; x=1711597655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YM97drc+mdmKK3MIBEM7YbCMasSOHnBNjJH4Pnwn8Xw=;
        b=UVWpJynXVSppBVNy8DObt9UJP3Xp/5KNCL4wpEeW4gmBCcHWLe5HAN8W1Q8t+OVD3M
         i6LNvqyB+pP3UTJg6CcG6NkK9Zq4eQGR36kDoHOhH4KkvAE7c5QZeSKipDy7xlG3wpVM
         4LZHuF3GOjJvwWushPjUhBVdMQKeGrZ7XQq3oQjA8O3Ak4M+4U7uZms+7BWd4FSkrTes
         eab5+O6LWniOJcXtzFNqvRaI4skRZzMY0w+dAysHDqt+6cOxd6IUWR58yja31l5kl+8s
         d5PpZSYL/sPOzGX9CkPy/fQoex0g04BD+J5oKJ25SQSkEgJ8NNoUv50zOhAuY49gvyY5
         BBhw==
X-Gm-Message-State: AOJu0Ywd6FPefFO69kbsDFrj9DNDVz4kq47kStHeZ/GEX4KlmctfgdJD
	7nOwXfEW2W6tPW9GI4kX6RC4T0km9m3OAg6f8pxjbUpi80Gkm02OYPiDO3zqShH8wIbIBkJZ0oE
	=
X-Google-Smtp-Source: AGHT+IGeXARpitDsPNO+U5qFBgckqBJpKJwzUmWPxwRVzsBzOFjtU8CTwSUcLgjs0376r4FVOJIybA==
X-Received: by 2002:a05:6214:21e7:b0:696:387d:1937 with SMTP id p7-20020a05621421e700b00696387d1937mr2509934qvj.25.1710992855552;
        Wed, 20 Mar 2024 20:47:35 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z17-20020a056214041100b0068ff8d75a90sm8594929qvx.19.2024.03.20.20.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 20:47:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/edk2: update to 202402
Date: Wed, 20 Mar 2024 23:46:49 -0400
Message-Id: <171099280981.1316622.7637755602977154498.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240320144942.58433-1-jon.mason@arm.com>
References: <20240320144942.58433-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 03:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5468


On Wed, 20 Mar 2024 10:49:40 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/3] arm/edk2: update to 202402
      commit: a77c2859d183efceaa70842775366fcfe46209c9
[2/3] arm/trusted-firmware-a: update to 2.10.2
      commit: 6bc5f4ff2d28788fe51c161be3dad88bceb2832d
[3/3] arm/sbsa-acs: update to 7.1.4
      commit: 362e7d6f05069ec0a4e47becfb7fc0beb3ce4ce6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


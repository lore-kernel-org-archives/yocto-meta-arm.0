Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D80C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:31:36 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.52952.1710786686429339246
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=C06oUWBn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.48, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21eea6aab5eso2412161fac.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786685; x=1711391485; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4A3pxBAo42SY4NXx0tOCZl2nBkYJ95dycOu6aG+T98=;
        b=C06oUWBnLL1hVqkFxgqoXGCBPYpEf5r2OwS7NAGBRotpm6fBSwA/wY7H2vhfOBB6Hr
         oQtrObICiI8V7obEkuygR0Ct71YdCfBt/s4MElM/b5qbWtN/bEo8dcppZirmp0QiAOID
         btH+oMkmW5gSz8I7ldoSmbBFqUl8z/zPKc7FHkeTrzgRZ+siK0Yj4Zmixxl0es3Pe6iu
         xzccDTiHSvWTDwQA64iHHpqkYGBhDGmvL7mymRvId54UK48tcOCH+Yinp0FofuIAN8Oe
         K779CSMvPaY54QfkE2jN78x8P/JjaacFi6BCwB8eQgWUmtXX42JvE+3zjBs5IJAFWpoN
         4pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786685; x=1711391485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4A3pxBAo42SY4NXx0tOCZl2nBkYJ95dycOu6aG+T98=;
        b=eXQZ8zp8bcbzgJRkvxxFviYT1Dp4p3yG2t9vjGokAHPMfxVpXDuEmquZ17wusqT5UC
         jy/tOCpOxzGfeQiLm64r9KzLDJxz1d9TD0BCfPd1DPfF69T6y27PXSpP7ohnyiFbizXk
         EW29C1wNwUhN2XYfCzNr9DWw4G7VdQnCHafOnORKCXm4dNt+gCAFAIA8oG6XlRqUBrbT
         25rKDIDq0A+wWRGetmTk+uV031j93Oh9YYrpPpgnTliftUER0emhbYMJm9JFrzLCdskk
         ImSeghZIVf3mAAz7/Q1FSCzDMX/KQNPhhk3NL+grYatr2iIQoG+aSKwdJtu0EVpOxmTW
         vRwg==
X-Gm-Message-State: AOJu0Yy/G8L+idi6IksabmiOsJKPCpeAH3vDdko74m9RzYX0HPzrY8bA
	RD1u5W9ts17eONb50i5xubNED1j3JcnQ/shYtcb/mG0+TmcNI07Tr+cYXfMJCBUf8sL6sgEMikk
	=
X-Google-Smtp-Source: AGHT+IH6jltVyLnMgz6AEa0MqTU4+uAZFBPecz9DgWtZ6fvvqDO6JO/In4e6n5gnD1bTRMPbWqgJMw==
X-Received: by 2002:a05:6871:5cc:b0:222:62ce:7993 with SMTP id v12-20020a05687105cc00b0022262ce7993mr503035oan.9.1710786685662;
        Mon, 18 Mar 2024 11:31:25 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g6-20020a05620a40c600b00788712ca95esm4771473qko.13.2024.03.18.11.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:31:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH] Add SECURITY.md
Date: Mon, 18 Mar 2024 14:25:38 -0400
Message-Id: <171078633839.3024366.927973109667088351.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318133730.3207078-1-ross.burton@arm.com>
References: <20240318133730.3207078-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:31:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5456


On Mon, 18 Mar 2024 13:37:30 +0000, ross.burton@arm.com wrote:
> 
> 

Applied, thanks!

[1/1] Add SECURITY.md
      commit: c93a1459dafa86a0bef346e95f688e7c32bc5eef

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


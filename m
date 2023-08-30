Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C6BC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 01:42:39 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.4650.1693359750625592336
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 18:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=mN4NaO69;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4121b5334f3so22271711cf.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1693359749; x=1693964549; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TnpDjut7SI8i7UOe/MONFhPkUv6XMf2qH9Hy/dyxHc=;
        b=mN4NaO69o4m8ij1p4YCTo7VwB9sKRDLAfJOFG12y+Mak3wZDYbaCFdVFyWjBr4KiPz
         UBWML44UyPNufDiDSWFexdk6P/qr2dq75uDUYc57hDTI8II7A+MrE+iI1qqvrBSu+Qpn
         WNBtVc8X1SpX+LwyaRxtIwlz14xNnhmk/irw63xaTwuTWVQYsbjrrBezE2D0WNjfExWK
         ZaOpUspxm1XgqT70oCWPCA6vTRXvIhA6BS3GYmgvtGgdQx1RuAT7tI3MIIxIHOpAqKDY
         16d3hn9sHziriIHiAN519Poo+ahnlrlZZY1ht+jgvoFpNLdv10SWHZ4/afWULP//lriF
         5Tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693359749; x=1693964549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TnpDjut7SI8i7UOe/MONFhPkUv6XMf2qH9Hy/dyxHc=;
        b=TeyreZDmr0kiiH2Ct21D4UslYkL0FdanwSJNAKaF2NNBCxC2Xe2VMoxquyAV4yPvQI
         n+uXyVq3kZBXqrTzPaxP8srwHVKTSUS0l6r0IB+6Jy+OV4y4UHR35TSrMmjkzTPz8BKO
         zfHJYICuHXuKYTYJI4LPoLgSuc9PkwkM2wfoheOyYrNc3lWd6ffPZbMngmtvDi3btGPZ
         ynzs/gNvjDoja2WL0Kz19M9V8wivfL/7SPhklpW4SiukVV2yebSPj2bRbrEz9UnDX1km
         +MbLa2GqAmQKCqi30wCVcLZwVtDGE7ujN+HXn3oM8zrlRxOPv6HTLNZQE9LF1Hyle7MV
         8avQ==
X-Gm-Message-State: AOJu0YwwlP8P1RQlnHwnMKfiLendRj+7peIKlelUGPDjygssLNOBXc/s
	7Z0IwlgPrN2QE88/tBhOaBxLhf4Fij85SgNcN9Q=
X-Google-Smtp-Source: AGHT+IHicXzYce/g8OFvEcX/YHw44E0JFAKhPRPS53p2i1R3QF8vZd17qUuWyjP78ouzLVCy1zh2uA==
X-Received: by 2002:a05:622a:14c7:b0:410:9b0f:e68a with SMTP id u7-20020a05622a14c700b004109b0fe68amr622123qtx.65.1693359749275;
        Tue, 29 Aug 2023 18:42:29 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id d4-20020ac86144000000b0040ff25d8712sm3443502qtm.18.2023.08.29.18.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 18:42:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] Remove explicit SRCPV
Date: Tue, 29 Aug 2023 21:41:57 -0400
Message-Id: <169335971720.1852220.16880293673996126237.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230829162224.2459115-1-ross.burton@arm.com>
References: <20230829162224.2459115-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 01:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5004


On Tue, 29 Aug 2023 17:22:23 +0100, ross.burton@arm.com wrote:
> As of oe-core a8e7b0f, PV doesn't need to contain SRCPV explicitly as
> base.bbclass will append it to PKGV if there is a + in the version. So,
> remove the redundant assignments.
> 
> Also change the boot-wrapper-aarch64 PV to 0+git as it's possible that
> some point they'll tag a release and we want to be able to upgrade to it.
> 
> [...]

Applied, thanks!

[1/2] Remove explicit SRCPV
      commit: ff334d8f65b724dde7be7bc994fa961743522fc5
[2/2] arm-bsp/external-system: set PACKAGE_ARCH as this is machine-specific
      commit: 730806956a783f3562fb1742993355613fab3b80

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


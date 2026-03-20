Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9B41099B36
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 18:56:37 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20461.1774032993071864000
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 11:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=l53NH5Bv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cbc593a67aso197116585a.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 20 Mar 2026 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774032992; x=1774637792; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGV3gnjNB8m21YfZuRmXrxlQuI8u6H21C1SeC76t2C0=;
        b=l53NH5Bv/Xo9mCyBHomb4Sh/zlnSQZoDBWd+KHdvG3SHQaWwqhXEsf25D27BoYa5ax
         rvCnqwaemXISZG0mfj5oRUXjNoVCdi39fNlBEaZsuMi+s/VdUcru+ziYMrpErC+weFdb
         jLhYuxwpdLUS79tkDVFsMIqeZo29TrcZNPZ5HORmikKUQ++DbS27jBJNUEexibnXe55f
         hP4zEOXMfuWHUDG7Bv/b8o2v1wwBksIQpHkyONJzIOIIJVxvzXUU551oXXQcO9aJffc5
         /TTnI50xPVHVa4pzeO2g49bTEVMBQnUoFWOHDKRhShF3FjpCV+h1IY/vBi15CebjRu24
         STCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774032992; x=1774637792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oGV3gnjNB8m21YfZuRmXrxlQuI8u6H21C1SeC76t2C0=;
        b=P2fObAnA+FNpTA1OM35NHmQxXw7W8egdD5pKg4cxq5jnTiFGpKx0mcBBPqGPdpzwQa
         QK2d02CahBB40nVkmG6PAxibfv42s4GbhkgCjidZCXVgSRPhW7vXWov7rjB5B9DddcBB
         q7PheI+IcL+HF6EqCYoeYF0yupmT/7VTP+nHjSDwxCMaZarEIQq7oIRv/oEBpU2sqT+U
         Z9OmC78R0Rdl34s5UV25ztkVikyzjw+Vd62lIFgKL1hPIRW+MzbxEWPLn/f5SwKbHo8J
         Lk/tNamYPLh4YY29JrADMhJ5y26AHr1NX6uiGxQm75gziJWY5esOlpr5USdPgaez3FGR
         WeRw==
X-Gm-Message-State: AOJu0Yw81XkPvYbWtQR/qtGtpJevxFd+WFcEoLSNomejpI5WhQRpE8Nu
	aZTRCzxbnLrJYrO3XmelzB4lGNWQ+QRa2tnbq0XlQJTUqejwO1v4MR2ZY9Ix3RSDQkBcV/V5q/O
	OPdw=
X-Gm-Gg: ATEYQzxrO92HdNot9Pm7H3exOVlPJEiunjPIavtIykfOIQ9qfKpLn659Ak32OiPhEP2
	8VgopbcWNPqairCOrYlgfRfKKNVUlnZA1QiUynTOWVyDKRGxoOWwpkuIA11WG72EZYQhPkuXfSg
	uYNGwjb3JVC31EG7KDA6Fs6YE1QM1cfa5iKyOoQ9LdjvxS37931fhyzVMB0StmmtpnbA13nM3d2
	yHKL+zPMSPYxXdFM7/TB+wCD3jWlGe+Jo4fSikgzf0yBOKdAMGwTk3J0+miseiWkdikQeD1HJYx
	L3MC6I8pdnFyvwUV+InTMVHGS0u35QHc2qUQ2kgDI1/uQF62baFi/IWPBVwHFyQDvLG2WUU/St4
	R7lELi1OzmnBMFpCcgrg5zSI+YjVz43mV3aHy/1hEMZ7i9OesN1iVppWGSwMtRyZKJTvKCOsAmA
	1qtyh73lbRprEF
X-Received: by 2002:a05:622a:1922:b0:509:3025:ff4e with SMTP id d75a77b69052e-50b37493412mr62164171cf.27.1774032991605;
        Fri, 20 Mar 2026 11:56:31 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e3d85bsm23684001cf.17.2026.03.20.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:56:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Michael Safwat <michael.safwat@arm.com>
Subject: Re: [PATCH] arm-bsp/trusted-firmware-m: corstone1000: Add AO lock write barrier
Date: Fri, 20 Mar 2026 14:56:22 -0400
Message-Id: <177403298232.3376355.4823822277022520945.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260316181612.2036877-1-michael.safwat@arm.com>
References: <20260316181612.2036877-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Mar 2026 18:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6966


On Mon, 16 Mar 2026 18:16:12 +0000, Michael Safwat wrote:
> Add the corstone1000 patch that inserts a compiler barrier before the
> first HOST_AO_LOCK_BITS write in CC_LibInit().
> 
> On corstone1000-mps3 with GCC 15.x, TF-M can HardFault on that first
> AO lock register update. Adding the barrier avoids the fault.
> 
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: Add AO lock write barrier
      commit: f4118f9b86742faa9fb649e58da3e00e45375645

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


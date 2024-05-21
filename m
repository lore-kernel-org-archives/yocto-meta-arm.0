Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C465AC41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:25 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.20873.1716301221348647302
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ACYk30cZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-792ce7a1febso146570285a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301220; x=1716906020; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YnXHWbHmkEWOiRn+xr8SYLh0kQEyEF2x9O6f8MSdro=;
        b=ACYk30cZrbuEGIyYEyQkJd8pWxVFjhyyT1/+4Fd93u3plctJ4etZ2e3zD5QYbh02jH
         QXNTlyVOItP1hLTHduiTAlVwhPStAjHWnSji4N/+WOK+Y2iCu+D56iAK6mj9rOoXkdld
         P037HpegkVyTJALO7Dc8DpUvHUQoiTjBV/KDgUw5Kd5NyI6HS779rPrz72vqyIA9TJHO
         jeTw+81NNQDHPiBXcFfmQw1IBu7NnHrAJdUPcDTyvYuwFwfVuyZX+2p54zMjZo7SqCw9
         mH4BC7/k8pOxs3Ojdt1+Ky9We3P6F/x9NUFwZbOeDEtNBRSlBveptIokx6hZr88yt3YJ
         XfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301220; x=1716906020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YnXHWbHmkEWOiRn+xr8SYLh0kQEyEF2x9O6f8MSdro=;
        b=sCZvervYdEjDjg3C3BwvoqIbLOIyL17zhfxAUe5OtPQAsSiGGiaqIW+ThdQYolGY/D
         KjZ7UObpbGloIEcwUdG9rqoQsDHZMwH0qa6lzS+jPIlVy1QsWpKVnJrQQ67OzpgDVb6c
         L8VAoAs3pB+WPw7j/NuwaDir1goAsDgUmjXkSc2rywEtUepZ1ht6jN2fjyZCMOwkqLWL
         3Zlj2ZBt/VJMaYKNFxrXNOEdgji9w/jcg7hx9Z6i63G9fVS2jAbmuYPufNXiN1mE5iV2
         cbCJk7jSiBPOce/XfMBMcJorw3gNwrTTd0Aug9OZEVTh9s6aEvg/kNpraA6HpRtRbHUD
         4F9A==
X-Gm-Message-State: AOJu0YyD1AsOLNswc1ZcR9Cx7Ws7W17fAX6Ky5WMEtrnBai2NYhABmxU
	QGpNJNfq8pGZIzdD80VernmrVyop98+g03tV9h3CJmzhzr1T70ivaK3ffDHqHXtdqRJ9SwxjEvA
	=
X-Google-Smtp-Source: AGHT+IHEOPYlhmAmZyTsnekVInX8qxr3YD8hKAdXlPByUFuJohxf/lH60oS0yO8+KvW6elCLgNvzTQ==
X-Received: by 2002:a05:620a:3942:b0:792:ea76:133c with SMTP id af79cd13be357-792ea76139cmr2759519585a.24.1716301220087;
        Tue, 21 May 2024 07:20:20 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2971c5sm1279866985a.51.2024.05.21.07.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	amr.mohamed@arm.com
Subject: Re: [PATCH] arm-systemready/linux-distros: Upgrade the Debian license
Date: Tue, 21 May 2024 10:19:45 -0400
Message-Id: <171630119064.2318166.17149111531336142944.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240517144454.1854499-1-amr.mohamed@arm.com>
References: <20240517144454.1854499-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5739


On Fri, 17 May 2024 15:44:54 +0100, amr.mohamed@arm.com wrote:
> Debian Licenses updated to reflect update from 11.7 to 12.4
> License now includes: AFL-2.0, AFL-2.1,
> GPL-2.0-with-autoconf-exception,
> GPL-2.0-with-OpenSSL-exception,
> GPL-3.0-with-autoconf-exception,
> GPL-3-with-bison-exception, SMAIL_GPL,
> BSD-2-Clause, BSD-3-Clause-Clear,
> BSD-4-Clause-UC, TCP-wrappers, OLDAP-2.8,
> PSF-2.0, BSL-1.0, bzip2-1.0.6, CC0-1.0,
> Libpng, Latex2e, Unicode-TOU, Unicode-DFS-2016,
> CC-BY-3.0, CC-BY-SA-3.0, CC-BY-SA-4.0, curl,
> MS-PL, NTP, FSFAP, FSFUL, FSFULLR, FSF-Unlimited,
> EDL-1.0, Vim, FTL, TCL, MPL-1.1, MPL-2.0,
> GFDL-1.1-or-later, GFDL-1.2-or-later,
> GFDL-1.3-no-invariants-or-later,
> GFDL-1.3-no-invariants-only, Artistic-1.0,
> Artistic-2.0, Apache-2.0,
> Apache-2.0-with-LLVM-exception, Spencer-86,
> MIT, MIT-CMU, MIT-advertising, Beerware,
> Intel, X11, ISC, IPL-1.0, SSH-OpenSSH, SSH-short,
> RSA-MD, OPL-1.0, PD
> 
> [...]

Applied, thanks!

[1/1] arm-systemready/linux-distros: Upgrade the Debian license
      commit: 6877a1c2bdd3cd275af2be3fa26c2e0be1da5b32

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


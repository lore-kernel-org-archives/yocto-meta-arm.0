Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BB8C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 17:26:37 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.426.1722014794204136743
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 10:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cN6VHmVL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.48, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5d5bb03fe42so655966eaf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jul 2024 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1722014793; x=1722619593; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVEO1e7b9v7aT2IQIm3raHW/WmWWdszFhPmOFUIV02M=;
        b=cN6VHmVL1AwjxgG5f6PDUi74VclYG+r0iGWgSpZMmcLv7HkbMXTA2C1PqivRa24ELu
         QF517KQeHcAaLTpJ7eSI8bkNffKPoUlwdxdYvOkPKAzwg9u5qHiITrxr5tal3SGIho7t
         sm4OLm03zOFTK91o/HWPSb7PdT3hFJaYMgaMZKHlRSr4+e3TFdlwxXglP1Vo8QsN4JLG
         IZucxD4da/T0uMlfk3CZuigfTRA3Jsf7kM9tQsQ3pkozYTB8+v9QipmeVMpV8C/jp33r
         X9O0nDKGhlgMbk+CCBVJ96C2lA/ifGbYoB+HixycF47NruUr1HiJx+OzAAJCDgdPbBeG
         j5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722014793; x=1722619593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVEO1e7b9v7aT2IQIm3raHW/WmWWdszFhPmOFUIV02M=;
        b=rEfDGKvKrPLsrBfBWeYzrGYY/Tvanrd6zLkdaneiVQxmzcC7EWvCzvbq6zCH5R/t6X
         a86T48N6h0d438NmE66d0BXbmOmC28ZwQfBW8nZUbO9n8sts+djkotiz+O3w0Bln1vpU
         Z+CvFTcdqkeETu4VibkCHeiJFH3Z1Wl+Nxk7sIlo0WjJW716Y5BeyvnRc0+PHrpV8wGx
         embvO+/BBdQJoii08JBq7soXvxItDhCkxG1FnPCQOHWomkot7NmVyAKY68FhkJzGGxIw
         glyq5KWhOhKd4bcrRy5NUS1DGtznKfgfy/nn5rltrUT8UeurWNUazG1OOrwVq8HQmP2O
         WoxQ==
X-Gm-Message-State: AOJu0YwetmnVJEwHWqiaOw+tk3CV46EMmSq9wvBYjyBsgtCMWQRFKdfi
	NomaaJbPLaPAmTrtoTjU/u7I9jNQg8zsmcdi54yOH6eOSEouHlUHFRPOAp9gLCaHQFeey2rlEyY
	=
X-Google-Smtp-Source: AGHT+IEHvL+dbtnYY8dr9gNjvmcLaXCdJAQUN4AlzOTpEO4h843p3+14uKOxiPp/C5L6uE/2TD88Dg==
X-Received: by 2002:a05:6218:260b:b0:1ac:660a:8a10 with SMTP id e5c5f4694b2df-1adb24223b4mr52568355d.3.1722014793164;
        Fri, 26 Jul 2024 10:26:33 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3fa94cddsm18277716d6.100.2024.07.26.10.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 10:26:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-systemready: explicitly disable SPDX in the fake image classes
Date: Fri, 26 Jul 2024 13:26:21 -0400
Message-Id: <172201478076.93900.10624876918898605050.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725131904.1934149-1-ross.burton@arm.com>
References: <20240725131904.1934149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jul 2024 17:26:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5926


On Thu, 25 Jul 2024 14:19:04 +0100, Ross Burton wrote:
> If SPDX 3.0 has been enabled then it :appends to IMAGE_CLASSES and then
> breaks at build time because there are several classes and recipes that
> look like but are not images.
> 
> Explicitly :remove the relevant class, but this really needs a better
> solution in the long term.
> 
> [...]

Applied, thanks!

[1/1] arm-systemready: explicitly disable SPDX in the fake image classes
      commit: c850a8624cf2415c15c50fdd773440c21c779e2d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


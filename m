Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10790.1793803914009720019
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 06:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20260707.gappssmtp.com header.s=20260707 header.b=NB5AuW6C;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.182, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b10d24345dso7183167b3.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20260707.gappssmtp.com; s=20260707; t=1793803913; x=1794408713; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpV+vXKXsvENwBDy4Ip8vVUku/IVjBciqw60akKuRv8=;
        b=NB5AuW6CTSYLMHfHZyjsOZhpcyQcVPBLJlnsp8gglzQpvydqdk8P79/K3j8ngURXct
         Y76Ry9R7/LFEJeHBWNY5IJIuBPGoySz2IOM5cpBguKoBfymz+S9Aasguojl3oxpr/mU0
         zjEKtwwXeeyV9K9XWBmcqak4CVfXJyHpqJgrLOVCGWJEUdrCKaVnv0zRgdLeYTvSQG8B
         ZWljfd63JC2OVHwpJseLmmXwKiZKnhWrz4XeyzLqtG3EQ8G75j3nxsWyg6Aa7Rj9hwLV
         PQdPXe7clwrnSHACrsVSvgPtgN/eJ7LcqbFOCmarEimpIgPxdgD2WyJRwPgVcxIJSMR6
         kvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803913; x=1794408713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpV+vXKXsvENwBDy4Ip8vVUku/IVjBciqw60akKuRv8=;
        b=biXuYeokeHfyjaIbUA+foGmrA7Ob/6f44+cL6/BJwTq5/Tr2BxQ37RWaRsCPYCAomU
         ttz/0toTBei1ET5O4aWvJd58bYrf9CBSV0VyBbhTGP2VuqR8S60bX/00mAbuWOuqmOzK
         6rGh7aQLoD6yyX2vKQoxbbd8X6erElOYN7CEs3jboe+l+rkxoVx1rLtC3lgvW5DkqdGi
         tGzNBrDrDrR4vSuLYGtipguJF6DIFmrTdVxKCAB85m9o5rhSbGxWvc0e4v60stMja0ak
         BoWZEpcz0caOVY3+LdqZ/I4lpYrFwf3ZMwDRLa53P2JXAVz2fmLiAYYxfFn7gEaR5Ksf
         +v4w==
X-Gm-Message-State: APuU4Z/rVNjN/OuAyqU35AARWBwZY86MpvEOnhnLIK9BJ18K3oq69pza
	6qS4aLcy76WtP/37ccUQMlqL7YclSyv6ND4lIVNoi+XQD6/j8Nt+/PwBW85ARBAZn1zaJ9h0ybq
	39Ng=
X-Gm-Gg: AYBFou24/twqVZUAbjfcSP9/88I4quYddbK65RzKzuTaxKa37aY29bP/Vv0jyRgl1R6
	MwYHdLAkPel32JMjqli7Ld+C/E6CckzMBjv5nMJTZgSXsd40DJZHO7gmaxrELHDhtUeTO+pme0N
	969pMUkB/G3RU0QTbM6u+hMOCFb0Bguohnd+SFVXjzHmQJnT4vYxD4GrMarlDH507q7TYVdiRKc
	LOcTbloTTI1QeweLPRjOqkUvTSwiURLauEytU2ss01OTpStclyNbfLuw+QfptEh6B8ISw5E3Fw3
	oMw/4ZQE6i5/yAi6m2o9DwmsboD69KjCfENPy/H/qEeyIwmp4TF7kF5zk57/osqSTkzSBansMKJ
	cJtIe5L6ZaGFxcgaexSQ0hD9f0lE1mQieclKZ8+u93ZQVPPAF8qBQkQg1ULa3+tks1HxRT6ca4o
	GksUHiA+JymFSZaCgcPegPEzqncSoNmTlFiSoDwZI6cvzf+dRsb72L2asiWHUSzpZATduevGw0m
	8usvR52P68Jkg5UIfbxAwvtY8Qvm6h8mu+Ct7MDUUCTGwQbORlXHMZ3SS4/VNGj4BLh1JQ8EQ6u
	gBlSTWkZVthU1hQHLw==
X-Received: by 2002:a05:690c:7482:b0:8b0:e238:2719 with SMTP id 00721157ae682-8b2b675b923mr130888857b3.31.1793803908140;
        Wed, 04 Nov 2026 06:51:48 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bbb4f7sm19838837b3.41.2026.11.04.06.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:51:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Cc: Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 0/2] arm/optee: update to 4.11.0
Date: Wed,  4 Nov 2026 09:49:12 -0500
Message-Id: <179380375285.3829190.15198203219794001404.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261104003624.3008551-1-ricardo.salveti@oss.qualcomm.com>
References: <20261104003624.3008551-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 14:52:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7204


On Wed, 04 Nov 2026 00:36:21 +0000, Ricardo Salveti wrote:
> Update OP-TEE (os, tadevkit, client, test, examples) and the fTPM TA
> to the 4.11.0 release.  corstone1000 stays on 4.10.0 through the
> recipes moved to meta-arm-bsp.
> 
> Tested with the meta-arm CI configurations:
> - qemuarm64-secureboot + testimage (gcc and clang): optee
>   (xtest -t regression) and ftpm suites pass
> - qemuarm-secureboot + testimage: optee and ftpm suites pass
> - qemuarm64-secureboot + qemuarm64-secureboot-ts + testimage: optee,
>   ftpm and trusted_services suites pass
> - corstone1000-fvp: optee-os and optee-client build at 4.10.0 from
>   meta-arm-bsp
> - git recipes build at the 4.11.0 revisions
> - yocto-check-layer passes for meta-arm, meta-arm-bsp and
>   meta-arm-toolchain
> 
> [...]

Applied, thanks!

[1/2] arm/optee: update to 4.11.0
      commit: 2fb4a73c2179ab855d250aed7e54ab83b4b5694f
[2/2] arm/optee-ftpm: update to 4.11.0
      commit: 2d339424072f7d86dc6e7f00f91e81ecf0290d42

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

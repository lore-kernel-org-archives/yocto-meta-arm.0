Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA05EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 04:01:17 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.5555.1688702467890451400
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 21:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=jt0pM96V;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-403470df1d0so13309641cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688702466; x=1691294466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBSXP9D5Sq+A/gJhDsaCLomdBM45vmrZaUSbhHAaL+U=;
        b=jt0pM96VU4nuozm2DDc3zC4lyjyKPlCp4JWCnu4aZYUclajVU540NHsOoxvPED5r0K
         VPQJLAAdAwlQeYytDji7FqLdR6OD40C9AU1WhZ2NnexZgeULq1xiskGuS//lgq6b/VT5
         rxHAqjHUnbRwFhqcgkJiyjoH+JN1hNF3/NvbZ9FP7vuVf8IErh8nn11RjUlk6zpGFH71
         jYvgl1kpCdVZ1u+LbfqBvbWpQ10B1O5/BMGz9qR1Q3G6DT24wQGENRwWfewnNV/8ugzJ
         8rgGXuhKVmOnYpQl9pwS9T94P73KSlM/QnPEaVTA1ZyYCGEtKE4PIRVaOGVw+QnD6Vo9
         c+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688702466; x=1691294466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBSXP9D5Sq+A/gJhDsaCLomdBM45vmrZaUSbhHAaL+U=;
        b=OafDNpO8XuQvjXYrKKrggv29qs1xsSD1PMLE7UlOnEvRZ9qLiw2qvHpI10yOjQ4GwO
         OGfCKaizooowDngrdsi2Nmwzw4/CLqoaBe2sWGK8h7p3/ORzl0FBmPUQ975zQjXIyHK+
         VshmQy8mDB+0DE25OW9+wRDUZskfei58iV7K8eUDDAo1RMhR57sjyXvNfWmVNbTRbbxD
         uKyzDHtCFWAH/C/pFmtq/+/abDf5k8AjlQTwepoaieq6OxjApCuEHA5NRDnAnp03s4TB
         ZxhXz5WbRS8GtnG6ynckyf7RoYPEkjcA9NqNfg0C55NIroUnM4VmzrQAcnA6nSjXypia
         DsCw==
X-Gm-Message-State: ABy/qLb1m3yrLH8VAdT2zooPP+qk1F3xj95RvSXmUHNGMT2T199Q/P9g
	kDiSZ7cRqbrgax9JSXCOpN3LGWad5SrAcU+vRzw=
X-Google-Smtp-Source: APBJJlFhcGvNmlcprmb4VdsooHXODXitcVTIU2I6yxCCJz0U9qAZ8WBBvyoaHXsewCyWRLY2BVWkGQ==
X-Received: by 2002:a05:622a:487:b0:400:8613:5379 with SMTP id p7-20020a05622a048700b0040086135379mr8434091qtx.8.1688702466476;
        Thu, 06 Jul 2023 21:01:06 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id l22-20020ac87256000000b003f9aecb599fsm1333069qtp.35.2023.07.06.21.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 21:01:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] CI: use Kas 3.3
Date: Fri,  7 Jul 2023 00:00:49 -0400
Message-Id: <168870244933.375012.3257693269885660382.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230704091857.3645929-1-ross.burton@arm.com>
References: <20230704091857.3645929-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Jul 2023 04:01:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4867


On Tue, 4 Jul 2023 10:18:55 +0100, ross.burton@arm.com wrote:
> Kas 3.3 has the following new features:
> 
> - kas: Introduce commit and branch as alternative to refspec key
> - kas: Warn if a repo uses legacy refspec
> - kas: add support for lock files via dump plugin
> - kas: track root repo dir config files of menu plugin
> - kas: add support for --log-level argument
> - kas: add GIT_CREDENTIAL_USEHTTPPATH environment variable
> - kas: improve error reporting
> - kas: drop support for Python 3.5
> - kas-container: fix invocations with --isar for some layers
> - kas-container: Purge tmp* on clean
> - kas-container: enable colored logging
> 
> [...]

Applied, thanks!

[1/3] CI: use Kas 3.3
      commit: 95e7e59c1a81d338d7eb710aabdf5c38cdddc45c
[2/3] CI: update to Kas format 14
      commit: 77b5e1c72c8d22a9c60eff26eb9bcad8edbc9e47
[3/3] CI: use branch, not refspec
      commit: c2d0905b51ff267839d1482640d913ccfa3bae63

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


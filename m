Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36954C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 21:16:37 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.7590.1678828591307821082
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 14:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=WY7OCBrv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id t13so6613256qvn.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1678828590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+NFlvP6LgiTZI5GrzjC9Dv1AMAvA2SUCRySJdOXxE0=;
        b=WY7OCBrvX5ZS41239Np/AC5NrLEvn8GmNj71u99+tzCt6g9MzhT8eVIhOd+Yzjh7Sx
         d9glqxXswLtEYWwJFilpXa5kKd4u/BvNe+msqlBTaYHEy+jIan/bymkwpSMOlQxm8loB
         usTujQlO8w0GNtQrisHtcyd/nKRReow4RJw8BSDA5uuJGIq0utLeorGTJQ0ERglawvRU
         NKcuiF3ShMCZJiSyhfBAoIAw2lRmiQOF6JI3eyRbgl6r/ByWVudFTHM+yLJ7UArXXwXm
         AlAAEEtrRnJD/Guc/e12fwLwlKRrXcacFGDnJ8P7OFNq0C23krGFQUSakNAhzJtcmZd4
         5rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678828590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+NFlvP6LgiTZI5GrzjC9Dv1AMAvA2SUCRySJdOXxE0=;
        b=e+4/YG7AFifYbhFMo21a8/tguox6KjijY60LyWpIJyysh7UL/TYltBLKZOgEFZmuiI
         0veYnL03dSghvoITxekkBK/Z9reRdgumovt2UNm33ILxAQbSoY5GEUn8WHEAJawguXa0
         h+pm0HYshqDJYKpGxVPiTYmPC2n/N3IWbxO78R4r1lseJScGLgZ1Uq+Kk+Delj2wu8CC
         m2JH6FCBPluJg/u15lFuNdvxT/wMtumvyxfYY0RjPTYF7dSZsYjpJRVtMxx9mkv/eskk
         hrKcREFTFuy4LZn3krG0s7xx8zgieLSfXhdBWPOHbb5/hZjccf2MGY+6vwi9d3r4d9Vk
         4ojA==
X-Gm-Message-State: AO0yUKUpIj6oEY03w0EQbaePnl/8SuCYpSaaX5WkKfPgcFAOGg5Poa/+
	+ZqcgWfaKcq/dEA4MMLFsRmm+MCYmuyo761A+LQ=
X-Google-Smtp-Source: AK7set+A3jaj5wTNqjUfY3Osa8Bl83u/3dQ7yQimprrerxIQ5DdlbsyPvapKhP9rkTf0VWtywM3pyA==
X-Received: by 2002:ac8:5815:0:b0:3d0:7bdf:42ec with SMTP id g21-20020ac85815000000b003d07bdf42ecmr7915427qtg.7.1678828589862;
        Tue, 14 Mar 2023 14:16:29 -0700 (PDT)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id z18-20020ac83e12000000b003bfbf16ad08sm2446700qtf.74.2023.03.14.14.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 14:16:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/edk2: update version and relocate edk2-basetools to be with edk2
Date: Tue, 14 Mar 2023 17:16:07 -0400
Message-Id: <167882856795.899250.56402732395669843.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314151742.501440-1-jon.mason@arm.com>
References: <20230314151742.501440-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 21:16:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4492

On Tue, 14 Mar 2023 11:17:41 -0400, Jon Mason wrote:
> Update to the latest version of EDK2.  There is an issue with memory not
> being initialized and hanging boot.  So revert the patch that is causing
> the issue until the proper solution can be found.

Applied, thanks!

[1/2] arm/edk2: update version and relocate edk2-basetools to be with edk2
      commit: b39fc31d761f185d92e6e7b2f7d20f30621e96b5
[2/2] arm-bsp/fvp-base: Add edk2 build testing
      commit: 99a3b07d522be82222952257a108034fc687a97b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


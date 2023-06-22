Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4679BEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:54:18 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.15216.1687449251399831278
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 08:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=FYDIxPr0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-62ffb475be0so56731056d6.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1687449250; x=1690041250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXXUqyDo9uiGs7kNhsM3FYriFV+4R1O86IAwXJ4y6Rc=;
        b=FYDIxPr0xqZVnEkAmUzVMFQzmJcoj586xHcQdGqkYbJwwJ+JPHb3kc2Bkz90NhWCgy
         non4ePIIpuXnCxXdO/mY21+a1fNZPbVsqqcL5GXxMZ3r/2cDEhsUWbf9DCQdp9n3wtwW
         +O/Nnhm/VabtZISB53M3lNtCRwZ7/jvdEfdmZflsrqiKJKGowCcrH8px0PrJkiyH9DvR
         1cyH8AbV6H1DbGGMCf8FtYNXd/ZKSFh3VtZBslEeamERRN+UgXby1YSxEFpP4RVDeUNZ
         SXJvYKAjNfGoMBIRHKQwg4KsiyhbjpH5iwaORVshz5vZqWiOM3QbwKG14eMqtFrpsvTz
         6SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687449250; x=1690041250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXXUqyDo9uiGs7kNhsM3FYriFV+4R1O86IAwXJ4y6Rc=;
        b=NZTrE9eNoxMS8UHPDm5aCPgFn48c0j8SH18pv6CemJ7cFfPbByrGHQ+gGA3FSe58Um
         eFvVVhxIaAjJldLstXjnu8xoVZeC+dGGNV/SJq1KegXldgrSRMRe9HRV58CXlwKkUwH+
         0moA3Ju9GdGU+XvgtG0hOesadxZirKpcuDPGp1nRSRLy43I36yui+vJPA+wbUjdSa3av
         Lv0ktu+Rr7XgEHvA8fiFNG4ixtajGYHedzhT2ak7FV9w8HolG+6R0d7zadjOvyym/aKr
         D7ILb5bDJgaabTFOJanzn+7BUDfScvaPHnUEkI45O+pR0v1cklC5aXIDe96oTc59qPCp
         N+qA==
X-Gm-Message-State: AC+VfDy3y29d5Jenu7ZBA5M6qqnsl/OVVuPNo5PMph/ASaWaRMhicEIh
	whRnqIqKKgCWl4sEkFbV9lp8H33h06ojNtpl5Z8=
X-Google-Smtp-Source: ACHHUZ4f2QDcUdoNWnbmVgDB6KmOtZxSEQIN0a67l+24ajvIk1hv1S+5gKQ82gP/6MkWt5BDEZpPfA==
X-Received: by 2002:a05:6214:19e4:b0:62f:f7dc:c8ec with SMTP id q4-20020a05621419e400b0062ff7dcc8ecmr23966938qvc.32.1687449250185;
        Thu, 22 Jun 2023 08:54:10 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id d11-20020a0ce44b000000b0061a68b5a8c4sm3915384qvm.134.2023.06.22.08.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:54:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"ross.burton@arm.com" <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] CI: always put the build logs in an artifact
Date: Thu, 22 Jun 2023 11:53:52 -0400
Message-Id: <168744923385.118182.2317798149809413222.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230621143610.1024837-1-ross.burton@arm.com>
References: <20230621143610.1024837-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:54:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4834

On Wed, 21 Jun 2023 15:36:09 +0100, ross.burton@arm.com wrote:
> It's useful to have known good logs when debugging problems, so always
> preserve the logs.

Applied, thanks!

[1/2] CI: always put the build logs in an artifact
      commit: 60abe46474060064f1080513f76a0e333ca487df
[2/2] CI: print the name of the documentation when building
      commit: 782ea3cd1688a14b4ad065bf47b1f9d8d0ea3fa4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


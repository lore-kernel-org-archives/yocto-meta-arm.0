Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A9FC433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:02:46 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.30554.1653325362119063710
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=h1eqPpyc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id l1so12543579qvh.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ED/esTyW+25NT2A0f7FTNy9jGUqAjv/yoA9M1J/Sx3U=;
        b=h1eqPpycooQZqY5QjkWBidUmvpB3pOunrZ0iZpniP7N/A0JIEjv7qITVcQcQLLP25M
         IKR+lRUqDLxzp83WhWOxsAf/lhSMz1U0e+W2zKWwL1nIZdgCoL+gutojGqdq9jQZDX8Y
         LThlNuxDqV4fbmC4RXGdD7Hgs4dNpxHMLfZ9aCqhwantbWXwBcJKYso1ZweCKjMLUlP8
         l1YkZD/EHd6WNDsy7wIZer3tQX/JRxrvHWd2Uli1vU0TGJW8n9nJxI3UNJaHRIKLeWsu
         44UkyXkpgf9EZzvgvJmUFFoL9S6fWlvn3Qo9CWRj62ttY/QqJwwKXN4MJ9/xX9AB3Nj/
         vscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ED/esTyW+25NT2A0f7FTNy9jGUqAjv/yoA9M1J/Sx3U=;
        b=DBhMkFL7naNrPRZ+UeFlAbxDCIT5DvPyiNPfH8JCDHcAujdGQdXJMEVI3L0NJLllcR
         iTsU8Uah2Yja5gKDBDfBMSsRX7EDriw2LJ9fhueNWKCJG0uv8koeTzKD+rTqqmriADeH
         cRtb8Hy7Ghyx20n2N5K5uV/7GSd2r4hlYIBLxYUFlqObJDX9wr/s4ZqkUHq19LRppn4W
         DBKP+N72pdppoRUrLiGQwWNw73EHN3QqhRllXpRn4P8tPL+pKh8xAntQ2NOqIioFDdG7
         /p9q3oQ7oF014yS/PF2fzUJgxY6n7OR5gt5bb+OmQgiZXZ1PryPI2m5CPokMnoRKHiNs
         4ChQ==
X-Gm-Message-State: AOAM532L9rxRLleAwHz4LqhIShzjBraZRldwL95QQx/MaOyZky34GTjI
	ZGd9LxbTCiQfZ5XZIJubbdcX2eW8IAswU4y8
X-Google-Smtp-Source: 
 ABdhPJyecJtLf8HiMMPTV1ZLA3DWqCbPT/d24c+jULGO0hCNr1bJ9BLd+b06MDuyVids58aJsdGBZA==
X-Received: by 2002:a05:6214:29e6:b0:462:2307:c3cf with SMTP id
 jv6-20020a05621429e600b004622307c3cfmr8364917qvb.66.1653325361128;
        Mon, 23 May 2022 10:02:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 t15-20020ac8588f000000b002f39b99f6bbsm4961863qta.85.2022.05.23.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:02:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-toolchain/external-arm-toolchain: set the version
 in the recipe
Date: Mon, 23 May 2022 11:42:11 -0400
Message-Id: <165332053185.113912.13411043257819137420.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517122818.3324458-1-ross.burton@arm.com>
References: <20220517122818.3324458-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 17:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3458

On Tue, 17 May 2022 13:28:16 +0100, Ross Burton wrote:
> We need to support multiple versions of external-arm-toolchain, partly as
> different versions have different layouts on disk, and partly because
> 11.2 doesn't work on pre-Broadwell hardware.
> 
> Rename this recipe so the version is in the filename, and dynamically
> set PKGV instead of PV so PREFERRED_VERSION is easier to use.

Applied, thanks!

[1/3] arm-toolchain/external-arm-toolchain: set the version in the recipe
      (no commit info)
[2/3] arm-toolchain/external-arm-toolchain: add back 10.3
      (no commit info)
[3/3] CI: use external-arm-toolchain 10.3
      commit: fc09cc0e8db287600625e64905170a6de24f2686

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


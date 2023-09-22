Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C584CD484F
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 18:26:34 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.5040.1695407194063933400
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 11:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=O0DkYHWs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7740c8509c8so132559085a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695407192; x=1696011992; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLIKgkpy1rWv+x032b1c+sjdGd+wdPmFSx+HyChq2MA=;
        b=O0DkYHWskwpY7fVZYYnClFGTSgXWdCAVFm9ETSg4P0lBvfadpaKGNZuXW8HE9+jGVC
         7T7wwa2hhltCp1h3qx/tfyz1cdURiXK6nEOmDkxwzalguUayw7xsFVnxwecUi4IOmRjV
         t7db8sNMtW6WUAVGA0tQipNNI2VaJ5aKA8NCFyPBfv+hWtXFBT38AYEi5cApeyADLd7l
         4iCw2yUAAeD5iehvXfMdKP1yPhPSVs/SEBvkDqLR4zoy4N27ufcG07CYVXyngTZXbK7J
         rBwQfzPPUfc8w0rnMB6Rnx/WX8wqffgaLFRw1PWL6tx51kORZOUkguaR0gBKPOLsXPeW
         WXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407192; x=1696011992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLIKgkpy1rWv+x032b1c+sjdGd+wdPmFSx+HyChq2MA=;
        b=q/DZd0DH45qIlZbJ8lRidGPBJCrtGi2HoVnThqPWA77JLe/gWXLd9JsnhKyUr0gAP5
         TJAUteyfmKNG0vcG+xbXAw5xzwricyoTU0BIT8PBbuxRvTeeWG/2Rd8Sth6rnTBqp3hy
         wSps+MN1JHcdO7l0m2hT7PtVWencQg6NEEt9wir7UI/tWdqhYEw2t+1ZehuVWhhQ/jYa
         rCgJLgMAZfq1l+OPKmiWowR80qvmC6SBiOE5Cm9ehTFpOflZC9+CsktiqfZNxKXK9WBQ
         g3X+g32/tQIZ68q3xgifl3MO3hD7CEbfQXMaN2L6qRt09On3qVagMldhNwxsPhkXf00B
         wkWA==
X-Gm-Message-State: AOJu0YziAt8lrwPgtcE5pwdWApDxemR1EN/wm8LBLXpe2ZyxzXTk7+a3
	AS10628cTgxmoOZi5xazYqQZXGZORKwzCsrQUQo=
X-Google-Smtp-Source: AGHT+IHyNmpxapoXUMqcDlnhICLz64UcW22g3bvrL+JmmLPxQfkemOyC5D8GdrSwF6m6sxkuKby+7w==
X-Received: by 2002:a05:620a:2add:b0:76c:b341:15b6 with SMTP id bn29-20020a05620a2add00b0076cb34115b6mr224447qkb.40.1695407192709;
        Fri, 22 Sep 2023 11:26:32 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u25-20020ae9c019000000b0076cc0a6e127sm1602877qkk.116.2023.09.22.11.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:26:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] CI: remove redundant variables in testimage.yml
Date: Fri, 22 Sep 2023 14:20:03 -0400
Message-Id: <169540680441.309200.12615912080528250640.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918111622.650459-1-ross.burton@arm.com>
References: <20230918111622.650459-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 18:26:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5070


On Mon, 18 Sep 2023 12:16:21 +0100, ross.burton@arm.com wrote:
> QEMU_USE_SLIRP is no longer needed[1] as adding slirp to
> TEST_RUNQEMUPARAMS is sufficient, so remove that.
> 
> Setting TEST_SERVER_IP also isn't needed as there's a default value now,
> and we disable the package management tests that would use the server
> IP.  When they work the correct IP can be set.
> 
> [...]

Applied, thanks!

[1/2] CI: remove redundant variables in testimage.yml
      commit: 9f2e78698e8ab3a53fbdec12a883039003f3406a
[2/2] arm-bsp: change port mapping for SSH to port 2222
      commit: db5a3093f3f597d769c2608b04e2a2615f02fbc8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


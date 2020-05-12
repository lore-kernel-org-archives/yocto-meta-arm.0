Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.1365.1589317944197234969
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 14:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=unlZWWJB;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id k6so15745693iob.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2020 14:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jkywDXLfI10vnMb00FWebWfoBsH1Op9BDELeJFglzXw=;
        b=unlZWWJBUM+6P6vH7u6Lys+rM1fdkc8uoenfdlihmj7+kuYDgAZV8vruYnMIG8e8ZC
         4+4Sc2YU8XKPYpbovk0Z9PovrD/ykHVt0wrUWekW2E3/AYFko/oPEdRzGCYaAOXaBaw1
         lEwX2k+PQ59bMZVx3hj4PFPr0zCN9SXi3MafnyaF8PLkWTGk9SMjAnIa211lb4R1GBGf
         /zG8O3fhO6WUH8t9g32X0HogTwk7MpTeDufYCrtr2cKsW57bZg72vq4huprxjj3MsoLc
         5hv5JoTaHxMxGjyPg/L+vjkh8uJZAS144ZQlxGxL+YIatFf0Kcc5Q9S/2VgC16wnVgFw
         jWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jkywDXLfI10vnMb00FWebWfoBsH1Op9BDELeJFglzXw=;
        b=CwfNYjuFb0Q3iOgxvXQp3/83Q3sTReHAMSP2uWf4LN4zEmvNpdHxbi1UIMKfWIuZf2
         /WHW9Eg6BMBTke+Y8HT5XWbdvuq8W3x2gWDouJckzmPe0rARQ0UAT0EWpTxWKDhExPld
         j0cHJI7cp2APO/2fSKEIRwkggbcr8YVSUrQb4uAtIrOdCbb+6ychJtq0YdVwxN+EJd+I
         tweQQAnvjgFDJFWYlqFKMmSpZr6Ag+uFpghyLPzATla5EUBt6rykivOrVcAIc2wd045V
         rZpQ9z44I20vpkW7pRFsnPgqEFgiXz72yjZc/J5wtIJM9AAO7ZrRTpaY/T67PbcCyUNp
         g0Rg==
X-Gm-Message-State: AGi0Pubvuhg30+238kbHxbQ3A3A0ibY6SNctiM92ZdEg00lBVRxkm6W5
	AxAUdJiqXNkr2QIKrYbyELiLfmB0x10=
X-Google-Smtp-Source: APiQypIh+xNyuyKPNMROcrARsVPBYv+IoXKCFnRht5Vi+R55/iLvj0zbE2S985JKhyo2QlOqsIEexg==
X-Received: by 2002:a5d:9505:: with SMTP id d5mr21969779iom.185.1589317943241;
        Tue, 12 May 2020 14:12:23 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:48c7:8e3e:3527:79a])
        by smtp.gmail.com with ESMTPSA id f143sm4008138ilh.17.2020.05.12.14.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:12:22 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2 0/2] TF-A Improvements
Date: Tue, 12 May 2020 16:12:17 -0500
Message-Id: <20200512211219.19262-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511142604.11860-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>

Makes several improvements to the TF-A recipe which should aid in it
being the canonical source of TF-A that other BSP layers can pull in
instead of replicating the recipe.

Joshua Watt (2):
  trusted-firmware-a: Build out of tree
  trusted-firmware-a: Install .elf file from subdirectory

 .../trusted-firmware-a/trusted-firmware-a.inc | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

-- 
2.17.1


Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE2CED247
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 22:20:39 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.5038.1728339633862726515
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Oct 2024 15:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=t3lWwB+E;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4581f44b9b4so34635001cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728339633; x=1728944433; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgjp4MGxtyD1DrA0pkz0sEBZ58fYqRhDq2RcAn+N+b0=;
        b=t3lWwB+EeO53rWbBlPOWG6162OVWjuENsMIKFdKihkiG5LbRT2t5EK0jPnXfugSJKQ
         D6W/yrEQL5HkmvEIUrnY2UD8wfuSL10Mjz319N/1nzKcDih8xuZfLanwnqimMJwsfZXk
         rFTIJLhdGKKzYVu3c7kdbCBYglZ27YJjQdnm4hq14lgPRrYUYVtj6xpo4ImvDZ6J9BP6
         zOpAUs/JNE8AtZdmWKnqyPtGQbQDsNiflObQL6WY1yRrKWoiaLgJ9OSQfEn6oaJ9qyHH
         sIkH9v3StlV2ufT5ZalQxSohTcV8JmwXxTJmMNW1LRL8cS5NtwlUzD85ekn0G78LDI8B
         TMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728339633; x=1728944433;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgjp4MGxtyD1DrA0pkz0sEBZ58fYqRhDq2RcAn+N+b0=;
        b=oUxVytvW8Bxkfy64VSDCLqFbLmJrOYjLxpopr0GNQCCbmM54F47qkEfi1M/Q9mtwpj
         sDVuUB80gOnyzzZoc3YQzHaTzjqs+WIvHP5xa+f4DsFVuzt2E1ORwA/S1Ki2VlDUdTol
         uvn+DlPObipjuT/oyJJBZ7aYhJJ0hu31E027mc3Api3SNclEIHRA1/2bqeX/pI60uR9j
         i0C+9/a4H59DsU0jbikYBp3gv2OAFX2A9X2oNQj4JIW37ynEsa4lNFmUJfFuVO0YEcVu
         ftcrDWQkSqHEpMMro+aWQrgQP0Qx54TMttY05mG8vDJuj7BVhv2kwNihjmN0GhR7s3DH
         KMsA==
X-Gm-Message-State: AOJu0Yy6ep0UjJIL1Eb8GMRfAv+Ttsc6oFFUbm9UO9ZjdnHkpYptZBLp
	BdrGkQhD1p8zzd9kvo7tCXfNWAdJF9udzCsfKcc/K4BOxlk5dPipUr/Iy3x7+yLGkZeeAPR/+cs
	=
X-Google-Smtp-Source: AGHT+IGhqjxQE5YMRDBC6AUvJJ9Lo9MtxkZhrNmO4K5SWO+OO/Lg+/CoAlW6dd8POh45NMENAPKjLA==
X-Received: by 2002:a05:622a:1303:b0:44f:f118:d875 with SMTP id d75a77b69052e-45d9bae353bmr179981871cf.36.1728339632620;
        Mon, 07 Oct 2024 15:20:32 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da74fabffsm30429021cf.28.2024.10.07.15.20.31
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 15:20:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 7 Oct 2024 18:20:31 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm scarthgap update
Message-ID: <ZwRer9xf-UJqOcVb@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 22:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6181

meta-arm has released an updated scarthgap support tag, 5.0.1.  The tag 
contains 34 patches from between 08 May 2024 and 23 Sep 2024.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 5.0.1) with a yocto-x.y.z tag (i.e., yocto-5.0.1).

Thanks,
Jon


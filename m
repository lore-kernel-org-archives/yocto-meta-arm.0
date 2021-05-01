Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.11362.1619897303452918334
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 12:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=HXDcZKJu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id n22so991803qtk.9
        for <meta-arm@lists.yoctoproject.org>; Sat, 01 May 2021 12:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=xOnpmb8PAe+RKjl2yTgtoo7r/s6rnSdhZ5VtQy1GDmE=;
        b=HXDcZKJuzaBzMTsVm235xMJqYt+g9THTiVKj4enX9w27walcJI6WtbFtStm5CjwMlw
         CIZp/vW73FtYHrJO111FFBE/xdLUQbTWeOhNNUSj9ELATKUXQSgHcFgTZXOIWXMgimd/
         Mw/1Kohfv38a7fiB8bS4aD7by8iSxJMMVKenQLoevixFv0rTB0gXevMWfqYYHMQw+DV1
         AaYB6sccNDqrO3mBclNxnmwn+VwEeakZJ2aPhmhSwDftiY3ilp+mz24BrBDPGDkaHg7r
         7ziJ4jCbFnHges06KAb5ktN9U5hVs+2Z24NSD3X0maGigucBmxQkSbtxoZyYuijVB/ei
         8I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=xOnpmb8PAe+RKjl2yTgtoo7r/s6rnSdhZ5VtQy1GDmE=;
        b=IhQ91Ki1B3shbNzVaTLNWtTeI7wkpIrGIzKlXM7uyhgNfJKNIAUIptfcfUh7A9RlqG
         tMVmkxO6vPzZfitpq8u1pJS4ytE9MleAAiaDGxB9rFq8M5FA+SVcarqm/kGJxTfCVmXw
         0msYgnhPgj6nRFe2E/G+vNqaRDJOhTcS27EXZxkrjYVW1qlLDk1pPObQdjNUWymYfXRx
         jiiO14OToyyN7wz6X1a316wdUY3e98xljhmvj4wwP2JESNGeWm1xfar3uHfsjc5kV2Nr
         76mR+DEfPUOpxMnhohGQ8ZEEIsSyLzSYxSPHwkOLSaB44iwGz0ZgGQbMyVVOeGXZ1mwQ
         Gkrw==
X-Gm-Message-State: AOAM530APpLIAoYe1QXRHzA8LWCZhrDi+JfhZeAsw06rtD0dlEyIyHTx
	DfXHbSoyR2yEF2YgzYBQJ0KRtoXzoDAo+Q==
X-Google-Smtp-Source: ABdhPJwT/OE5AvS6Ekuv2H7Bsb63JfldkiqRCC8az5l7c32kMplhSb+eRbOdXwEss2rSbekxU88nqQ==
X-Received: by 2002:ac8:72ca:: with SMTP id o10mr10142825qtp.197.1619897302273;
        Sat, 01 May 2021 12:28:22 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:1c11:4abb:70dd:58e6])
        by smtp.gmail.com with ESMTPSA id j13sm4985864qth.57.2021.05.01.12.28.22
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 12:28:22 -0700 (PDT)
Date: Sat, 1 May 2021 15:28:20 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm dunfell update
Message-ID: <20210501192820.GC20675@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

meta-arm has released an updated dunfell support tag.  The tag contains
28 patches from between 4 Dec 2020 and 24 Mar 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.1.2) with a "yocto-x.y.z" tag (i.e., yocto-3.1.2).

Thanks,
Jon

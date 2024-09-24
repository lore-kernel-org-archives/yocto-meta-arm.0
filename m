Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5078CF9C69
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 17:20:32 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.943.1727198424087410801
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Sep 2024 10:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=HlkUINxd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.176, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e039666812so2842910b6e.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Sep 2024 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727198423; x=1727803223; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fsUimgxwqO/J+ykCS4zNv/+uQhvHmvAg1Tk9YnrtqPk=;
        b=HlkUINxdasmOdowlkk+MhbzrJtnEhRSXlmu8FuLHP3Ck3Lzxq1+FdKODbwj0hsRQAA
         SPjyhxiLakmjGs87QoRaKyMim6o2cVSFVuh+diPn6vLkE05YKh/LJuoMnH4NONM8+/pH
         i1CjeTpM2AEWM5JTbOS7YlWKgQVXeJNl6XF+KEHgMdQgtJuc8dGHaj3jkLOlDOG8McQn
         iYfz0m9eszyTA6N3EDeeZe8ywMLaLlkgAK9i853n0YC3GyBwsivYzR7GJ9G381l4KgEw
         DMctOEALa1ovZ+HXMAjz9z6yufcZL7e5uuBZ88c1JPlwthJU0I0gscka+n9FqTBh6vWd
         wBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727198423; x=1727803223;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsUimgxwqO/J+ykCS4zNv/+uQhvHmvAg1Tk9YnrtqPk=;
        b=WDGYerKH1/23xgWEOwU3Sa0Kp+nyQCjz8m/xdqZ2XIgXHCjQe1lGvc6an006cAgDLX
         P9RO+PhYFSLGuJcKZSFdyM5+JO8qJ2raPjg5PVkesRuyJxbzGU883i6rCNg7uSazqXU/
         0AoiDN8WIgidzFl85+7OoiwUyN7w3gV8RPOZo/AamUA9acOkStS6O39lk2jNO/YKYhr1
         psU+5UzuqX0N1iBgQqX/eqVFMGAIfR9XANeEcgBmuOAuQVaX3aJiZ2IvlSzQ9Mt9XakW
         rYukwedTJlwMX3D65mdbC6iWZ0oM8HGOstccwGcu1xRz2L2DjqJFSzLJhV7AWYmMI8Gf
         /N5w==
X-Gm-Message-State: AOJu0YxyMIwUtetyXaN1fHGPSGddZ+aJxAwG2PLHwS6YZPSTXbSZmlrD
	TArgZ6jVr+F2eB4u6qYlgd8vkuID6B+zlQ7Z7gJ2iHChbzKWF+Qxn5RZWHg9z7scqzJXf4c9YT4
	s9EteNtuFnGIYnuXxiVTnjqDfI0CreqcF8cPCp0VyT8D5tngLdA==
X-Google-Smtp-Source: AGHT+IHlDhFTEtYUwNj3pIf2rDd7KQMy0SJgn7zW0GnrxNvAeItVe3SyyrS4iQtanU/kHn1fYiFJ8lQeB6QHjlOGy8Q=
X-Received: by 2002:a05:6808:4497:b0:3e2:936f:64c1 with SMTP id
 5614622812f47-3e2936f6574mr1662817b6e.4.1727198423046; Tue, 24 Sep 2024
 10:20:23 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 24 Sep 2024 13:20:12 -0400
Message-ID: <CAPoiz9y5d9bksfEOgUghMG68VUZQu=1E6CBThoVo0CtW5yr6Eg@mail.gmail.com>
Subject: meta-arm styhead release freezing soon (Friday)
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Sep 2024 17:20:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6101

With the Yocto Project Styhead release expected soon, meta-arm will be
following suit.

Barring an issue or something on the mailing list that is in the
process of being integrated, we will cut the meta-arm styhead release
on Friday, 4 October 2024.  To this end, we will be freezing on
Friday, 27 September 2024.  So, please push all outstanding commits as
soon as possible.  If you have something coming that you need in the
styhead release, please let us know.

If there are questions or comments, please feel free to respond to
this thread on the mailing list or email me and/or Ross directly.

Thanks,
Jon

